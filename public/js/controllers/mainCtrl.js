angular.module('liftedSki').controller('mainCtrl', ['$scope', '$http', 'ngCart', function($scope, $http, ngCart) {
    ngCart.setTaxRate(7.5);
    ngCart.setShipping(2.99);
}]);

  // $scope.login = function(username, password) {
  //   console.log('Logging in with', username);
  //   skiService.login({
  //     username: username,
  //     password: password
  //   })
  //   .then(function(res) {
  //     login();
  //   })
  // }
  //
  // // $scope.getUserId = function(id){
  // //   skiService.getUserId(id).then(function(response){
  // //     console.log('this is get ski pole', response);
  // //     $scope.user = response.data[0];
  // //   })
  // // }
  //
  // $scope.login = skiService.login;
  // $scope.logout = skiService.logout;
  // //$scope.getUserId($stateParams.id);
