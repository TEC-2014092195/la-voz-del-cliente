app.controller('regUserDataCtrl', function ($scope, $timeout, $location,AuthService) {
    $scope.resultado = {
        nombrecompleto: "",
        nombreusuario: "",
        clave: "",
        reclave: ""
    }

    $scope.submit = function (isValid) {
        if (isValid) {
            if($scope.resultado.clave != $scope.resultado.reclave){
                alert("Las claves no coinciden");
                $scope.resultado.clave = "";
                $scope.resultado.reclave = "";
            }
            if($scope.resultado.correo != $scope.resultado.recorreo){
                alert("Los correos no coinciden");
                $scope.resultado.correo = "";
                $scope.resultado.recorreo = "";
            }
            if($scope.resultado.correo == $scope.resultado.recorreo && $scope.resultado.clave == $scope.resultado.reclave){
                var promise = AuthService.insertUsuario($scope.resultado);
                promise.then(
                    function(callback) {
                        console.log(callback);
                        localStorage.user = JSON.stringify(callback);
                        $location.path('register').replace();
                    },
                    function(errorCallback) {
                        console.log('Error: ', errorCallback);
                    });
            }
        }


    }
});
