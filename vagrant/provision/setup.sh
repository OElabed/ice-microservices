#!/usr/bin/env bash

# wget -c http://chromedriver.storage.googleapis.com/2.24/chromedriver_linux64.zip

# sudo ln -s /home/vagrant/node_modules node_modules

# Run SONARQUBE
#  sudo docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube
#  # docker run -d -p 9000:9000 -p 9092:9092 sonarqube

# # Run keycloak
#  docker run -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -p 9990:9990 -p 9998:8080 jboss/keycloak

#  # Run Nexus
# mkdir /home/vagrant/data
# mkdir /home/vagrant/data/nexus-data && chown -R 200 /home/vagrant/data/nexus-data
# docker run -d -p 8081:8081 --name nexus -v /srv/nexus-data:/sonatype-work sonatype/nexus


if [ -e /.installed ]; then
  echo 'Already installed.'

else
  echo ''
  echo 'INSTALLING'
  echo '----------'

  # Add Google public key to apt
  wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -

  # Add Google to the apt-get source list
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee -a /etc/apt/sources.list

  # Update app-get
  apt-get update -yq

  # Install Java, Chrome, Xvfb, and unzip
  apt-get -y install google-chrome-stable unzip

  # Download and copy the ChromeDriver to /usr/local/bin
  cd /tmp
  wget "https://chromedriver.googlecode.com/files/chromedriver_linux64_2.2.zip"
  wget "https://selenium.googlecode.com/files/selenium-server-standalone-2.35.0.jar"
  unzip chromedriver_linux64_2.2.zip
  mv chromedriver /usr/local/bin
  mv selenium-server-standalone-2.35.0.jar /usr/local/bin

  # So that running `vagrant provision` doesn't redownload everything
  touch /.installed
fi

# Start Xvfb, Chrome, and Selenium in the background
export DISPLAY=:10
cd /vagrant

echo "Starting Xvfb ..."
Xvfb :10 -screen 0 1366x768x24 -ac &

echo "Starting Google Chrome ..."
google-chrome --remote-debugging-port=9222 &

echo "Starting Selenium ..."
cd /usr/local/bin
nohup java -jar ./selenium-server-standalone-2.35.0.jar &

