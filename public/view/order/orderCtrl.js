angular.module('liftedSki').controller('cartCtrl', function($scope, $state, $stateParams, skiService) {

  $scope.getAllProducts = function() {
      skiService.getAllProducts().then(function(response) {
          $scope.products = response.data;
    })
  }

    $scope.createOrder = function(product){
      skiService.createOrder(product).then(function(response){
        $scope.product = response.data;
      })
    }


    $scope.getAllProducts();

})
