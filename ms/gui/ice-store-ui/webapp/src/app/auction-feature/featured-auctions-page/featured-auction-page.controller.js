angular.module('abs.auctionFeature.featuredAuctionPage').controller('FeaturedAuctionPageController', featuredAuctionPageController);

featuredAuctionPageController.$inject = ['$scope'];
function featuredAuctionPageController($scope){
  var vm = this;

  console.log(vm);
  console.log($scope);
}