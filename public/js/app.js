angular.module('liftedSki', ['ui.router', 'ngCart'])  //ui.router is awesome
  .config(function ($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: '../view/home.html',
        controller: 'singleProductCtrl'
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

      .state('order', {
        url: '/order/id',
        templateUrl: '../view/order/order.html',
        controller: 'mainCtrl'
      })

      .state('team', {
        url: '/team',
        templateUrl: '../view/team.html',
        controller: 'teamCtrl'
      })

      .state('teamDetails', {
        url: '/teamDetails/:id',
        templateUrl: '../view/teamDetails.html',
        controller: 'teamDetailsCtrl'
      })

      .state('video', {
        url: '/video',
        templateUrl: '../view/video.html'
      })




       $urlRouterProvider
         .otherwise('/');


  });
