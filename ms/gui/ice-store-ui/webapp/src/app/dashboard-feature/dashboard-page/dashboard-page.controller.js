angular.module('abs.dashboardFeature.dashboardPage').controller('DashboardPageController', dashboardPageController);

dashboardPageController.$inject = ['$scope'];
function dashboardPageController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}