angular.module('abs.dashboardFeature').directive('liveBidsDashboard', liveBidsDashboard);

function liveBidsDashboard(){
  return {
    restrict: 'A',
    templateUrl: 'views/live-bids-dashboard.html',
    controller: 'LiveBidsDashboardController',
    controllerAs: 'vm',
    replace: true
  };
}