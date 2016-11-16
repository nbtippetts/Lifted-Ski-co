angular.module('liftedSki').controller('singleProductCtrl', function($scope, $state, $stateParams, skiService) {

    $scope.state = $state;

    $scope.getProduct = function(id) {
        skiService.getProduct().then(function(response) {
            if (response.data.product_id === $stateParams.id) {
                $scope.product = response.data;
            }
        });
    };
    $scope.getProduct();

});
