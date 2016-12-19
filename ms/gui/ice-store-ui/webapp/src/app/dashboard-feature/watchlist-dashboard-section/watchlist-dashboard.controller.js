angular.module('abs.dashboardFeature').controller('WatchlistDashboardController', watchlistDashboardController);

watchlistDashboardController.$inject = ['$scope'];
function watchlistDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}