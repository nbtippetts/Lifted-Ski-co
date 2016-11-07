angular.module('liftedSki', ['ui.router'])
  .config(function ($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: '../view/home.html',
        controller: 'homeCtrl'
      })

      .state('skis', {
        url: '/skis',
        templateUrl: '../view/skis.html',
        controller: 'skisCtrl'
      })

      .state('video', {
        url: '/video',
        templateUrl: '../view/video.html'
      })

      .state('details', {
        url: '/details/:id',
        templateUrl: '../view/details.html',
        controller: 'detailsCtrl'
      })

      $urlRouterProvider
        .otherwise('/');


  });
