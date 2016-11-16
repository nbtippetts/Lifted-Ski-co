angular.module('liftedSki').service('skiService', function($http) {


  this.getProduct = function(id) {
      return $http({
        method: 'GET',
        url: '/api/products/:id' + id
      });
  }

  this.getAllProducts = function(){
      return $http({
        method: 'GET',
        url: '/api/products'
      });
    };


  //this service holds all of the http call to the server for now
  // this.register = function(user) {
  //   console.log(user);
  //   return $http({
  //     method: 'POST',
  //     url: '/auth/local/register',
  //     data: user
  //   })
  // }
  //
  //
  // this.loginUser = function(user) {
  //   return $http({
  //     method: 'POST',
  //     url: '/auth/local',
  //     data: user
  //   })
  // }


  // this.logout = function() {
  //   return $http({
  //     method: 'GET',
  //     url: '/auth/logout'
  //   })
  //   .then(function(res) {
  //     //console.log('logout', res)
  //     return res.data;
  //   })
  //   .catch(function(err) {
  //     console.log(err);
  //   })
  // }

  // this.read = function(){
  //   //console.log("this is user,", user)
  //   return $http({
  //     method: 'GET',
  //     url: '/api/users'
  //   });
  // }

  // this.getUserId = function(id){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/user/user:id?id=' + id
  //   });
  // }


  // this.getAll = function(){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/skis'
  //   });
  // }
  //
  // this.getSki = function(id){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/skis/ski:id?id=' + id
  //   });
  // }
  //
  // this.getAllPoles = function(){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/poles'
  //   });
  // }
  //
  // this.getSkiPoles = function(id){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/poles/pole:id?id=' + id
  //   });
  // }
  //
  // this.getTeams = function(){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/teams'
  //   });
  // }
  //
  // this.getTeam = function(id){
  //   return $http({
  //     method: 'GET',
  //     url: '/api/teams/team:id?id=' + id
  //   });
  // }

})
