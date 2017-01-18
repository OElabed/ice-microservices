angular.module('abs.dashboardFeature').directive('notificationsDashboard', notificationsDashboard);

function notificationsDashboard() {
  return {
    scope: {},
    restrict: 'A',
    templateUrl: 'views/notifications-dashboard.html',
    controller: 'NotificationsDashboardController',
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