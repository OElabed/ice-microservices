angular.module('abs.dashboardFeature').controller('LiveBidsDashboardController', liveBidsDashboardController);

liveBidsDashboardController.$inject = ['$scope'];
function liveBidsDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}