absConfig.pushAfterBootstrap('abs.connexionFeature');

angular.module('abs.connexionFeature').config(connexionConfig);

connexionConfig.$inject = ['$stateProvider'];
function connexionConfig($stateProvider){
  $stateProvider.state('signin', {
    url: '/signin',
    controller: 'SigninPageController',
    controllerAs: 'vm',
    templateUrl: 'views/signin-page.html',
    data: {
      pageTitle: 'Login page',
      pageDesc: 'Login page to access features.'
    }
  });
}