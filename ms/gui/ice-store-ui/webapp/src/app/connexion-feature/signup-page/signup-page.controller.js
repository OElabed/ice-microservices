angular.module('abs.connexionFeature.signupPage').controller('SignupPageController', signupPageController);

signupPageController.$inject = ['$scope', '$stateParams', '$filter'];
function signupPageController($scope, $stateParams, $filter){
  var vm = this;

  console.log($scope);
  console.log(vm);
  console.log($stateParams);
  console.log($filter);
}