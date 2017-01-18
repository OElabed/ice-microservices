angular.module('abs.dashboardFeature').controller('MessagesDashboardController', messagesDashboardController);

messagesDashboardController.$inject = ['$scope'];
function messagesDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}