angular.module('abs.connexionFeature.loginPage').controller('LoginPageController', loginPageController);

loginPageController.$inject = ['$scope', '$stateParams', '$filter'];
function loginPageController($scope, $stateParams, $filter){
  var vm = this;

  console.log($scope);
  console.log(vm);
  console.log($stateParams);
  console.log($filter);

  // CustomerModelService.customerProfile($stateParams.customerId).then(function customerProfileResponse(response){
  //   var pageTitle,
  //       pageDesc;

  //   vm.customer = response;
  //   pageTitle = !response.error ? vm.customer.name + ' ' + vm.customer.surname + '\'s Profile Page'
  //                               : 'Sorry, this customer profile does not exist';
  //   pageDesc = !response.error ? vm.customer.name + ' ' + vm.customer.surname + '\'s Profile on Angular Boilerplate Study. Member since ' + $filter('date')(vm.customer.joined, 'shortDate')
  //                              : 'No description available for this customer.';
  //   $scope.$emit('changedTitle', pageTitle);
  //   $scope.$emit('changedDesc', pageDesc);
  // });
}