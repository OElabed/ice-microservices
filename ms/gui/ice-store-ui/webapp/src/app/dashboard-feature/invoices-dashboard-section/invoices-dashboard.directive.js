angular.module('abs.dashboardFeature').directive('invoicesDashboard', invoicesDashboard);

function invoicesDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/invoices-dashboard.html',
    controller: 'InvoicesDashboardController',
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