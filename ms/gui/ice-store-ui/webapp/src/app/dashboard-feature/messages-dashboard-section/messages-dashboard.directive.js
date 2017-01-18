angular.module('abs.dashboardFeature').directive('messagesDashboard', messagesDashboard);

function messagesDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/messages-dashboard.html',
    controller: 'MessagesDashboardController',
    controllerAs: 'vm',
    replace: true,
    bindToController: {
      isActive: '='
    },
    link: link
  };


  function link($scope) {
    console.log($scope);
  }
}