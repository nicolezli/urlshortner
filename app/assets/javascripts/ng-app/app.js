app = angular.module('app', [
    'ngAnimate',
    'ui.router',
    'truncate',
    'templates'
]).config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
    function($stateProvider, $urlRouterProvider, $locationProvider) {
        $stateProvider
            .state('home', {
                url: '/',
                templateUrl: 'application/home.html',
                controller: 'HomeCtrl'
            });
        $urlRouterProvider.otherwise('/');
        $locationProvider.html5Mode(true);
    }
]);