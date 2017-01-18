angular.module('abs.dashboardFeature').controller('HistoryDashboardController', historyDashboardController);

historyDashboardController.$inject = ['$scope', 'NgTableParams'];
function historyDashboardController($scope, NgTableParams) {
  var vm = this;


  vm.users = [

    { name: "Madhav Sai", age: 10, location: 'Nagpur' },

    { name: "Suresh Dasari", age: 30, location: 'Chennai' },

    { name: "Rohini Alavala", age: 29, location: 'Chennai' },

    { name: "Praveen Kumar", age: 25, location: 'Bangalore' },

    { name: "Sateesh Chandra", age: 27, location: 'Vizag' },

  ];
vm.usersTable = new NgTableParams({}, { dataset: vm.users });

  console.log(vm);
  console.log($scope);
  // console.log(NgTableParams);
}