angular.module('liftedSki').controller('allProductsCtrl', function($scope, $state, skiService) {

    $scope.state = $state;

    $scope.getAllProducts = function() {
        skiService.getAllProducts().then(function(response) {
            $scope.products = response.data;
            $state.go('products');
        });
    };
    $scope.getAllProducts();

});
