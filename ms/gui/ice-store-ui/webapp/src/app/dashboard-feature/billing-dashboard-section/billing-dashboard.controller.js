angular.module('abs.dashboardFeature').controller('BillingDashboardController', billingDashboardController);

billingDashboardController.$inject = ['$scope'];
function billingDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}