app.config(function($stateProvider, $urlRouterProvider, $locationProvider) {

    $stateProvider
        .state('home', {
            url: '/',
            templateUrl: 'application/home.html',
            controller: 'HomeCtrl'
        });


    $urlRouterProvider.otherwise('/');
    $locationProvider.html5Mode(true);
});