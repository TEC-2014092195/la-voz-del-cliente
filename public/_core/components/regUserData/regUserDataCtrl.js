app.controller('regUserDataCtrl', function ($scope, $timeout, $location) {
    $scope.resultado = {
        nombrecompleto: "",
        nombreusuario: "",
        clave: "",
        reclave: ""
    }

    $scope.submit = function () {
        if($scope.resultado.clave != $scope.resultado.reclave){
            alert("Las claves no coinciden");
            $scope.resultado.clave = "";
            $scope.resultado.reclave = "";
        }
        else{
            console.log($scope.resultado);
        }

    }
});
