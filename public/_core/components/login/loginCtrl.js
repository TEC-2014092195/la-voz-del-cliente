app.controller('loginCtrl', function ($scope, $timeout, $location, AuthService) {

    $scope.model = {
        NombreComercial: null,
        NombreUsuario: null,
        PasswordConfirm: null,
        Password: null
    };

    var pais_elegido = null;
    $scope.init = function () {
        var promise = AuthService.getPaises();
        promise.then(
            function (callback) {
                $scope.paises = callback;

            },
            function (errorCallback) {
                console.log('Error: ', errorCallback);
            })
    };
    $scope.init();


    $scope.selectPais = function(criteria) {
        if ($scope.paises.length != 0) {
            var index = $scope.paises.map(function (d) {
                return d['Nombre'];
            }).indexOf(criteria);
            pais_elegido = $scope.paises[index];
        }
    }

    $scope.submit = function (isValid) {
        if(pais_elegido==null){
            alert("Ingrese el País");
        }
        if(isValid){

            $scope.model.pais = pais_elegido;
            var promise = AuthService.validarSesion($scope.model);
            promise.then(
                function(callback) {
                    console.log(callback);
                    if(callback.length == 0){
                        alert("No registrado");
                    }else{
                        localStorage.userinfo = JSON.stringify(callback);
                        $location.path('main').replace();
                    }


                },
                function(errorCallback) {
                    console.log('Error: ', errorCallback);
                });
        }

    }


});

