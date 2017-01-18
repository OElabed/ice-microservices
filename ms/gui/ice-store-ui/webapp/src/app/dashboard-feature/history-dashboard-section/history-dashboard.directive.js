angular.module('abs.dashboardFeature').directive('historyDashboard', historyDashboard);

function historyDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/history-dashboard.html',
    controller: 'HistoryDashboardController',
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