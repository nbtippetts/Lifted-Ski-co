angular.module('liftedSki').controller('skisCtrl', function($scope, skiService) {

  $scope.getAll = function(){
    skiService.getAll().then(function(response){
      console.log('this is getAll', response)
      $scope.allSkis = response.data;
    })
  }

  $scope.getAll();

})
