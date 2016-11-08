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

  this.getAllPoles = function(){
    return $http({
      method: 'GET',
      url: '/api/poles'
    });
  }

  this.getSkiPoles = function(id){
    return $http({
      method: 'GET',
      url: '/api/poles/pole:id?id=' + id
    });
  }

  this.getTeams = function(){
    return $http({
      method: 'GET',
      url: '/api/teams'
    });
  }

  this.getTeam = function(id){
    return $http({
      method: 'GET',
      url: '/api/teams/team:id?id=' + id
    });
  }




})
