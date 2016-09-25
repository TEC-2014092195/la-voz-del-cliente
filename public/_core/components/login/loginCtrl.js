app.controller('loginCtrl', function ($scope, $timeout, $location, AuthService) {

    $scope.model = {
        NombreComercial: null,
        NombreUsuario: null,
        Pais: null,
        PasswordConfirm: null,
        Password: null
    };

    $scope.init = function () {
        var promise = AuthService.getPaises();
        promise.then(
            function (callback) {
                $scope.paises = callback;
                $scope.model.Pais = $scope.paises[0];
            },
            function (errorCallback) {
                console.log('Error: ', errorCallback);
            })
    }
    $scope.init();


    $scope.submit = function () {
        console.log($scope.model);
    }


});

