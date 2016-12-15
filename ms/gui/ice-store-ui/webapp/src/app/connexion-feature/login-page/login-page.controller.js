angular.module('abs.connexionFeature.loginPage')
  .controller('LoginPageController', ['$scope', '$stateParams', '$filter',
    function ($scope, $stateParams, $filter) {
      var vm = this;

      $scope.buttonLogin = "Login";
      $scope.showLoginSpinner = false;

      $scope.login = function () {
        console.log("login process...");
        console.log("username= " + $scope.credentials.username);
        console.log("password= " + $scope.credentials.password);
        //console.log("authModelService= " + authModelService);


        $scope.buttonLogin = "Logging in . . .";
        $scope.showLoginSpinner = true;

        // authModelService.login($scope.credentials.username, $scope.credentials.password).then(function (data) {
        //   console.log(data);
        // }, function (err) {
        //   console.log(err);
        //  // $scope.invalidLogin = true;
        // }).finally(function () {
        //   //$scope.buttonText = "Login";
        // });





      };


      console.log($scope);
      console.log(vm);
      console.log($stateParams);
      console.log($filter);
    }
  ]);