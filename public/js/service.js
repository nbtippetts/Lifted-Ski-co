angular.module('liftedSki').service('skiService', function($http) {


  this.login = function(credentials) {
    return $http({
      method: "POST",
      url: '/auth/local',
      data: credentials
    })
    .then(function(res) {
      return res.data;
    })
    .catch(function(err) {
      console.log('ERROR LOGGING IN!', err);
    })
  }

  this.getUser = function() {
    return $http({
      method: 'GET',
      url: '/auth/me'
    })
    .then(function(res) {
      return res.data;
    })
    .catch(function(err) {
      console.log(err);
    })
  }

  this.logout = function() {
    return $http({
      method: 'GET',
      url: '/auth/logout'
    })
    .then(function(res) {
      console.log('logout', res)
      return res.data;
    })
    .catch(function(err) {
      console.log(err);
    })
  }

  this.newUser = function(user){
    //console.log("this is user,", user)
    return $http({
      url: '/api/user',
      method: 'POST',
      data: user
    });
  }

  // this.getUserId = function(id){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/user/user:id?id=' + id
  //   });
  // }


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
