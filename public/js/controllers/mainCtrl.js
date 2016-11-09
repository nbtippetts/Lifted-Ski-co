angular.module('liftedSki').controller('mainCtrl', function($scope, skiService, $stateParams, $state) {

  $scope.newUser = function(user){
    //console.log('this is new user', user)
     skiService.newUser(user).then(function(response){
        $scope.user = response.data;
    })
  }

  function getUser() {
    skiService.getUser().then(function(user) {
      if (user) $scope.user = user.username;

    })
  }

  getUser();

  $scope.login = function(username, password) {
    console.log('Logging in with', username, password);
    skiService.login({
      username: username,
      password: password
    })
    .then(function(res) {
      getUser();
    })
  }

  // $scope.getUserId = function(id){
  //   skiService.getUserId(id).then(function(response){
  //     console.log('this is get ski pole', response);
  //     $scope.user = response.data[0];
  //   })
  // }

  $scope.getUser = skiService.getUser;
  $scope.logout = skiService.logout;
  //$scope.getUserId($stateParams.id);

})
