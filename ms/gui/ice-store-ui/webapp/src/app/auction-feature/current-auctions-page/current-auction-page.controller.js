angular.module('abs.auctionFeature.currentAuctionPage').controller('CurrentAuctionPageController', currentAuctionPageController);

currentAuctionPageController.$inject = ['$scope'];
function currentAuctionPageController($scope){
  var vm = this;

  console.log(vm);
  console.log($scope);
}