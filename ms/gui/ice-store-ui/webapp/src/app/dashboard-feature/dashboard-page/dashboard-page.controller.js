angular.module('abs.dashboardFeature.dashboardPage').controller('DashboardPageController', dashboardPageController);

dashboardPageController.$inject = ['$scope'];
function dashboardPageController($scope) {
  var vm = this;

  vm.menu = {};

  vm.menu.live = { active: true, news: 0 };
  vm.menu.watchlist = { active: false, news: 0 };
  vm.menu.history = { active: false, news: 0 };
  vm.menu.messages = { active: false, news: 12 };
  vm.menu.notifications = { active: false, news: 15 };
  vm.menu.invoices = { active: false, news: 6 };
  vm.menu.billing = { active: false, news: 0 };

  var disableAllMenuItems = function () {

    vm.menu.live.active = false;
    vm.menu.watchlist.active = false;
    vm.menu.history.active = false;
    vm.menu.messages.active = false;
    vm.menu.notifications.active = false;
    vm.menu.invoices.active = false;
    vm.menu.billing.active = false;
  };


  vm.changeMenuItem = function (name) {

    disableAllMenuItems();

    switch (name) {
      case 1:
        vm.menu.live.active = true;
        break;
      case 2:
        vm.menu.watchlist.active = true;
        break;
      case 3:
        vm.menu.history.active = true;
        break;
      case 4:
        vm.menu.messages.active = true;
        break;
      case 5:
        vm.menu.notifications.active = true;
        break;
      case 6:
        vm.menu.invoices.active = true;
        break;
      case 7:
        vm.menu.billing.active = true;
        break;
      default:
        console.error("[" + name + "] item not found");
    }
  };


  console.log(vm);
  console.log($scope);
}