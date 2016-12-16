angular.module('abs.helpFeature.faqPage').controller('FaqPageController', faqPageController);

faqPageController.$inject = ['$scope', '$stateParams', '$filter'];
function faqPageController($scope, $stateParams, $filter){
  var vm = this;

  console.log($scope);
  console.log(vm);
  console.log($stateParams);
  console.log($filter);
}