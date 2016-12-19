angular.module('abs.dashboardFeature').directive('historyDashboard', historyDashboard);

function historyDashboard(){
  return {
    restrict: 'A',
    templateUrl: 'views/history-dashboard.html',
    controller: 'HistoryDashboardController',
    controllerAs: 'vm',
    replace: true
  };
}