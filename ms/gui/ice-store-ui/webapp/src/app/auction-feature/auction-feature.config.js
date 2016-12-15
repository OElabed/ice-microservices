absConfig.pushAfterBootstrap('abs.auctionFeature');

angular.module('abs.auctionFeature').config(auctionConfig);

auctionConfig.$inject = ['$stateProvider'];
function auctionConfig($stateProvider){
  $stateProvider.state('category', {
    url: '/category',
    controller: 'CategoryPageController',
    controllerAs: 'vm',
    templateUrl: 'views/category-page.html',
    data: {
      pageTitle: 'Category page'
    }
  }).state('featured-auctions', {
    url: '/featured-auctions',
    controller: 'FeaturedAuctionPageController',
    controllerAs: 'vm',
    templateUrl: 'views/featured-auction-page.html',
    data: {
      pageTitle: 'Featured auctions page'
    }
  }).state('current-auctions', {
    url: '/current-auctions',
    controller: 'CurrentAuctionPageController',
    controllerAs: 'vm',
    templateUrl: 'views/current-auction-page.html',
    data: {
      pageTitle: 'Current auctions page'
    }
  });
}