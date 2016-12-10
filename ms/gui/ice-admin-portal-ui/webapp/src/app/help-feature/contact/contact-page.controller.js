angular.module('abs.helpFeature.contactPage')
  .controller('ContactPageController', ['$scope', '$stateParams', '$filter',
    function ($scope, $stateParams, $filter) {
      var vm = this;

      console.log($scope);
      console.log(vm);
      console.log($stateParams);
      console.log($filter);

    }
  ]);