angular.module('liftedSki', ['ui.router'])  //ui.router is awesome
  .config(function ($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: '../view/home.html',
        controller: 'mainCtrl'
      })

      .state('products', {
        url: '/products',
        templateUrl: '../view/products/allProducts.html',
        controller: 'allProductsCtrl'
      })

      .state('product', {
        url: '/products/:id',
        templateUrl: '../view/products/singleProduct.html',
        controller: 'singleProductCtrl'
      })


      // .state('skis', {
      //   url: '/skis',
      //   templateUrl: '../view/skis.html',
      //   controller: 'skisCtrl'
      // })
      //
      // .state('poles', {
      //   url: '/poles',
      //   templateUrl: '../view/poles.html',
      //   controller: 'polesCtrl'
      // })
      //
      // .state('video', {
      //   url: '/video',
      //   templateUrl: '../view/video.html'
      // })
      //
      // .state('team', {
      //   url: '/team',
      //   templateUrl: '../view/team.html',
      //   controller: 'teamCtrl'
      // })
      //
      // .state('details', {
      //   url: '/details/:id',
      //   templateUrl: '../view/details.html',
      //   controller: 'detailsCtrl'
      // })
      //
      // .state('poleDetails', {
      //   url: '/poleDetails/:id',
      //   templateUrl: '../view/poleDetails.html',
      //   controller: 'poleDetailsCtrl'
      // })
      //
      // .state('teamDetails', {
      //   url: '/teamDetails/:id',
      //   templateUrl: '../view/teamDetails.html',
      //   controller: 'teamDetailsCtrl'
      // })
      //
       $urlRouterProvider
         .otherwise('/');


  });
