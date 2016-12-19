angular.module('abs.dashboardFeature').directive('watchlistDashboard', watchlistDashboard);

function watchlistDashboard(){
  return {
    restrict: 'A',
    templateUrl: 'views/watchlist-dashboard.html',
    controller: 'WatchlistDashboardController',
    controllerAs: 'vm',
    replace: true
  };
}