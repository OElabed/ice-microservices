angular.module('abs.helpFeature.contactPage').controller('ContactPageController', contactPageController);

contactPageController.$inject = ['$scope', '$stateParams', '$filter'];
function contactPageController($scope, $stateParams, $filter){
  var vm = this;

  console.log($scope);
  console.log(vm);
  console.log($stateParams);
  console.log($filter);
}