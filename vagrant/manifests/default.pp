exec { 'time date':
	command => '/usr/bin/timedatectl set-timezone Europe/Paris'
}

exec { 'apt-get update':
	command => '/usr/bin/apt-get update -yq',
	require => Exec [ 'time date' ]	
}

# GIT
####################

exec { 'add git repository':
	command => '/usr/bin/apt-add-repository ppa:git-core/ppa -y'
}

exec { 'apt-get update git':
	command => '/usr/bin/apt-get update -yq',
	require => Exec [ 'add git repository' ]	
}

exec { 'install git':
	command => '/usr/bin/apt-get install git -yq',
	require => Exec [ 'apt-get update git' ]
}

package { 'git':
  ensure  => 'present',
  require => Exec [ 'install git' ]
}


# Nginx
exec { 'install nginx':
	command => '/usr/bin/apt-get install nginx -yq',
	require => Exec [ 'apt-get update' ]	
}

# NODE JS
####################

exec { 'download nodejs':
	command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -',
	require => Exec [ 'apt-get update' ]	
}

exec { 'install nodejs':
	command => '/usr/bin/apt-get install -y nodejs',
	require => Exec [ 'download nodejs' ]	
}

exec { 'add node_modules folder':
	command => '/bin/mkdir /home/vagrant/node_modules'
}

package { 'nodejs':
  ensure  => 'present',
  require => Exec [ 'install nodejs' ]
}


# JQ
####################

exec { 'install jq':
	command => '/usr/bin/apt-get install -yq jq',
	require => Exec [ 'apt-get update' ]
}

package { 'jq':
  ensure  => 'present',
  require => Exec [ 'install jq' ]
}


# JAVA tools
####################

exec { 'add java repository':
	command => '/usr/bin/apt-add-repository ppa:openjdk-r/ppa -y'
}

exec { 'apt-get update java':
	command => '/usr/bin/apt-get update -yq',
	require => Exec [ 'add java repository' ]
}

exec { 'install java':
	command => '/usr/bin/apt-get install openjdk-8-jdk -y',
	require => Exec [ 'apt-get update java' ]
}

exec { 'add JAVA_HOME':
	command => '/bin/echo \'JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64\' >> /home/vagrant/.bashrc && /bin/echo \'export JAVA_HOME\' >> /home/vagrant/.bashrc',
	require => Exec [ 'install java' ]
}


# Gradle
####################

exec { 'add gradle ppa dependencies':
	command => '/usr/bin/add-apt-repository ppa:cwchien/gradle -y'
}

exec { 'apt update gradle':
	command => '/usr/bin/apt-get update -yq',
	require => Exec [ 'add gradle ppa dependencies' ]	
}

exec { 'install gradle':
	command => '/usr/bin/apt-get install gradle -yq',
	require => Exec [ 'apt update gradle' ]	
}

package { 'gradle':
  ensure  => 'present',
  require => Exec [ 'apt update gradle' ],
}

# PIP Python
####################

exec { 'install pip':
	command => '/usr/bin/apt-get -y install python-pip',
	require => Exec [ 'apt-get update' ]
}

# Docker
####################

exec { 'install docker':
	command => '/usr/bin/apt-get install docker.io -y',
	require => Exec [ 'apt-get update' ]
}

exec { '(Docker) Link and fix paths docker':
	command => '/bin/ln -sf /usr/bin/docker.io /usr/local/bin/docker',
	require => Exec [ 'install docker' ]
}

exec { '(Docker) Command completion docker add file':
	command => '/usr/bin/touch /etc/bash_completion.d/docker.io',
	require => Exec [ 'install docker' ]
}

exec { '(Docker) Command completion docker':
	command => '/bin/sed -i \'$acomplete -F _docker docker\' /etc/bash_completion.d/docker.io',
	require => Exec [ '(Docker) Command completion docker add file' ]
}

exec { '(Docker) Boot docker add file':
	command => '/usr/bin/touch /etc/init.d/docker.io',
	require => Exec [ 'install docker' ]
}

exec { '(Docker) Boot docker':
	command => '/usr/sbin/update-rc.d docker.io defaults',
	require => Exec [ '(Docker) Boot docker add file' ]
}

exec { '(Docker) Install docker compose':
	command => '/usr/bin/pip install docker-compose',
	require => Exec [ 'install docker','install pip' ]
}

exec { '(Docker) Remote API Config':
	command => '/bin/chmod 777 /etc/default/docker && /bin/echo \'DOCKER_OPTS="-H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock"\' >> /etc/default/docker && /usr/bin/service docker restart',
	require => Exec [ '(Docker) Boot docker' ]
}

exec { '(Docker) Remote API Config variable':
	command => '/bin/echo \'DOCKER_HOST=tcp://localhost:4243\' >> /home/vagrant/.bashrc && /bin/echo \'export DOCKER_HOST\' >> /home/vagrant/.bashrc',
	require => Exec [ '(Docker) Remote API Config' ]
}

exec { '(Docker) Add compose API version':
	command => '/bin/echo \'COMPOSE_API_VERSION=1.18\' >> /home/vagrant/.bashrc && /bin/echo \'export COMPOSE_API_VERSION\' >> /home/vagrant/.bashrc',
	require => Exec [ '(Docker) Remote API Config variable' ]
}

package { 'docker':
  ensure  => 'present',
  require => Exec [ 'install docker' ]
}


# Node Modules
####################

exec { '(Node modules) install npm':
	command => '/usr/bin/npm install -g npm',
	require => Package [ 'nodejs' ]	
}

exec { '(Node modules) install grunt':
	command => '/usr/bin/npm install -g grunt-cli',
	require => Package [ 'nodejs' ]
}

exec { '(Node modules) install gulp':
	command => '/usr/bin/npm install -g gulp',
	require => Package [ 'nodejs' ]
}


exec { '(Node modules) install bower':
	command => '/usr/bin/npm install -g bower',
	require => Package [ 'nodejs' ]
}

exec { '(Node modules) install git-changelog':
	command => '/usr/bin/npm install -g git-changelog',
	require => Package [ 'nodejs' ]
}

exec { '(Node modules) install phantomjs':
	command => '/usr/bin/npm install -g phantomjs',
	require => Package [ 'nodejs' ]
}

exec { 'add PHANTOMJS_BIN':
	command => '/bin/echo \'PHANTOMJS_BIN=/usr/bin/phantomjs\' >> /home/vagrant/.bashrc && /bin/echo \'export PHANTOMJS_BIN\' >> /home/vagrant/.bashrc',
	require => Exec [ '(Node modules) install phantomjs' ]
}


# Ruby
####################

exec { 'install ruby dev':
	command => '/usr/bin/apt-get install ruby-dev -yq',
	require => Exec [ 'apt-get update' ]
}

exec { '(Gem modules) install bundler':
	command => '/usr/bin/gem install bundler',
	require => Exec [ 'install ruby dev' ]
}

exec { '(Gem modules) install compass':
	command => '/usr/bin/gem install compass',
	require => Exec [ 'install ruby dev' ]
}


# VirtualBox guest additions
####################

exec { '(VirtualBox guest additions) install dkms':
	command => '/usr/bin/apt-get install virtualbox-guest-dkms -yq',
	require => Exec [ 'apt-get update' ]
}

exec { '(VirtualBox guest additions) install utils':
	command => '/usr/bin/apt-get install virtualbox-guest-utils -yq',
	require => Exec [ 'apt-get update' ]
}

exec { '(VirtualBox guest additions) install x11':
	command => '/usr/bin/apt-get install virtualbox-guest-x11 -yq',
	require => Exec [ 'apt-get update' ]
}


# Selenium chrome e2e 
####################

# exec { '(Selenium) key google':
# 	command => '/usr/bin/wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | /usr/bin/apt-key add -',
# 	require => Exec [ 'apt-get update' ]
# }
# 
# exec { '(Selenium) add key google':
# 	command => '/bin/echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | /usr/bin/tee -a /etc/apt/sources.list',
# 	require => Exec [ '(Selenium) key google' ]
# }
# 
# exec { '(Selenium) apt-update':
# 	command => '/usr/bin/apt-get update -yq',
# 	require => Exec [ '(Selenium) add key google']	
# }
# 
# exec { '(Selenium) apt-install':
# 	command => '/usr/bin/apt-get install google-chrome-stable unzip -yq',
# 	require => Exec [ '(Selenium) apt-update' ]	
# }
#### TODO



# C++ build tools
####################

exec { 'install g++':
	command => '/usr/bin/apt-get install build-essential -yq',
	require => Exec [ 'apt-get update' ]
}