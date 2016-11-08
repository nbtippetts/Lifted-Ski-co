angular.module('liftedSki').controller('polesCtrl', function($scope, skiService) {

    $scope.getAllPoles = function(){
      skiService.getAllPoles().then(function(response){
        console.log('this is getAllPoles', response)
        $scope.allPoles = response.data;
      })
    }

    $scope.getAllPoles();

})
