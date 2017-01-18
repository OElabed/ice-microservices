angular.module('abs.dashboardFeature').controller('InvoicesDashboardController', invoicesDashboardController);

invoicesDashboardController.$inject = ['$scope'];
function invoicesDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}