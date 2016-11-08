angular.module('liftedSki').controller('teamCtrl', function($scope, skiService){

    $scope.getTeams = function(){
      skiService.getTeams().then(function(response){
        $scope.teams = response.data;
      });
    }

    $scope.getTeams();
})
