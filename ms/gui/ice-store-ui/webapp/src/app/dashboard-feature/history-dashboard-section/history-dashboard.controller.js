angular.module('abs.dashboardFeature').controller('HistoryDashboardController', historyDashboardController);

historyDashboardController.$inject = ['$scope'];
function historyDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}