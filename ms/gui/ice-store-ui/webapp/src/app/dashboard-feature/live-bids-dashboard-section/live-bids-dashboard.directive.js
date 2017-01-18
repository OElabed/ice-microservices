angular.module('abs.dashboardFeature').directive('liveBidsDashboard', liveBidsDashboard);

function liveBidsDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/live-bids-dashboard.html',
    controller: 'LiveBidsDashboardController',
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