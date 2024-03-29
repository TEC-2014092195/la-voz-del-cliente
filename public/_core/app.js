var app = angular.module('lvdcApp', ['ngRoute','angularCSS']);
app.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {

    $routeProvider.when('/home', {
        templateUrl: '_core/components/home/homeView.html',
        controller: 'homeCtrl',
        css: '_core/components/home/home.css'
    });

    $routeProvider.when('/login', {
        templateUrl: '_core/components/login/loginView.html',
        controller: 'loginCtrl',
        css: '_core/components/login/login.css'
    });

    $routeProvider.when('/main', {
        templateUrl: '_core/components/main/mainView.html',
        controller: 'mainCtrl',
        css: '_core/components/main/main.css'
    });

    $routeProvider.when('/register', {
        templateUrl: '_core/components/register/registerView.html',
        controller: 'registerCtrl'
    });

    $routeProvider.when('/regUserData', {
        templateUrl: '_core/components/regUserData/regUserDataView.html',
        controller: 'regUserDataCtrl'
    });

    $routeProvider.when('/regSocialNetworks', {
        templateUrl: '_core/components/regSocialNetworks/regSocialNetworksView.html',
        controller: 'regSocialNetworksCtrl'
    });

    $routeProvider.when('/editPYME', {
        templateUrl: '_core/components/editPYME/editPYMEView.html',
        controller: 'editPYMECtrl'
    });

    $routeProvider.when('/encuesta', {
        templateUrl: '_core/components/encuesta/encuestaView.html',
        controller: 'encuestaCtrl',
        css: '_core/components/encuesta/encuesta.css'
    });

    $routeProvider.when('/dashboard',{
        templateUrl: '_core/components/dashboard/dashboardView.html',
        controller: 'dashboardCtrl',
        css: '_core/components/dashboard/dashboardStyle.css'
    });


    $routeProvider.otherwise({
        redirectTo: '/home'
    });

    // use the HTML5 History API
    $locationProvider.html5Mode(true);
}]);

app.run(function($rootScope, $route, $location,$window){
    //Bind the `$locationChangeSuccess` event on the rootScope, so that we dont need to
    //bind in induvidual controllers.

    $rootScope.$on('$locationChangeSuccess', function() {
        $rootScope.actualLocation = $location.path();
    });
});


