angular.module('abs.auctionFeature.categoryPage').controller('CategoryPageController', categoryPageController);

categoryPageController.$inject = ['$scope'];
function categoryPageController($scope){
  var vm = this;

  console.log(vm);
  console.log($scope);
}