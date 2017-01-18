angular.module('abs.dashboardFeature').directive('watchlistDashboard', watchlistDashboard);

function watchlistDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/watchlist-dashboard.html',
    controller: 'WatchlistDashboardController',
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