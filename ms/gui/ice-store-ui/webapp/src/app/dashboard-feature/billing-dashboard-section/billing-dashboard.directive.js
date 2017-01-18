angular.module('abs.dashboardFeature').directive('billingDashboard', billingDashboard);

function billingDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/billing-dashboard.html',
    controller: 'BillingDashboardController',
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