angular.module('liftedSki').service('skiService', function($http) {

  this.newUser = function(user){
    return $http({
      url: '/api/user',
      method: 'POST',
      data: user
    });
  }

  
  this.getAll = function(){
    return $http({
      method: 'GET',
      url: '/api/skis'
    });
  }

  this.getSki = function(id){
    return $http({
      method: 'GET',
      url: '/api/skis/ski:id?id=' + id
    });
  }


})
