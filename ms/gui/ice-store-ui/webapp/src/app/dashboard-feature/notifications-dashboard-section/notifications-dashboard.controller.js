angular.module('abs.dashboardFeature').controller('NotificationsDashboardController', notificationsDashboardController);

notificationsDashboardController.$inject = ['$scope'];
function notificationsDashboardController($scope) {
  var vm = this;

  console.log(vm);
  console.log($scope);
}