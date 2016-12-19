absConfig.pushAfterBootstrap('abs.dashboardFeature');

angular.module('abs.dashboardFeature').config(dashboardConfig);

dashboardConfig.$inject = ['$stateProvider'];
function dashboardConfig($stateProvider){
  $stateProvider.state('dashboard', {
    url: '/dashboard',
    controller: 'DashboardPageController',
    controllerAs: 'vm',
    templateUrl: 'views/dashboard-page.html',
    data: {
      pageTitle: 'Dashboard page'
    }
  });
}