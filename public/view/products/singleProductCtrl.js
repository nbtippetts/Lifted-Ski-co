angular.module('liftedSki').controller('singleProductCtrl', function($scope, $state, $stateParams, skiService) {

  $scope.getProduct = function(){
      skiService.getProduct($stateParams.id).then(function(response){
      $scope.product = response.data[0];
      });
    }

  $scope.getProduct();

});
