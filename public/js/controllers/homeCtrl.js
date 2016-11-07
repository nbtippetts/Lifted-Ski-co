angular.module('liftedSki').controller('homeCtrl', function($scope, skiService) {

  $scope.newUser = function(user){
     skiService.newUser(user).then(function(response){
       console.log('this is new user', response)
        $scope.user = response.data;
    })
  }

})
