absConfig.pushAfterBootstrap('abs.connexionFeature');

angular.module('abs.connexionFeature').config(connexionConfig);

connexionConfig.$inject = ['$stateProvider'];
function connexionConfig($stateProvider){
  $stateProvider.state('signup', {
    url: '/signup',
    controller: 'SignupPageController',
    controllerAs: 'vm',
    templateUrl: 'views/signup-page.html',
    data: {
      pageTitle: 'Sign Up page',
      pageDesc: 'Sign Up page to access features.'
    }
  }).state('login', {
    url: '/login',
    controller: 'LoginPageController',
    controllerAs: 'vm',
    templateUrl: 'views/login-page.html',
    data: {
      pageTitle: 'Login page',
      pageDesc: 'Login page to access features.'
    }
  });
}