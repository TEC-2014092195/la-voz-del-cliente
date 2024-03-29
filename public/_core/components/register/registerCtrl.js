app.controller('registerCtrl', function($scope,$location,AuthService){

    $scope.resultado = {
        activa:true,
        familiar:false,
        direccion:"",
        estado:"",
        foto:"",
        generoPropietario:"",
        identificacion:"",
        inicioOperaciones:00,
        nombreComercial:"",
        pais:"",
        sector:"",
        telefono:""
    };

    var pais_elegido,
     estado_elegido,
     sector_elegido,
     genero_elegido = null;
    $scope.init = function () {
        var promise = AuthService.getPaises();
        promise.then(
            function (callback) {
                $scope.paises = callback;
                //$scope.model.Pais = $scope.paises[0];
            },
            function (errorCallback) {
                console.log('Error: ', errorCallback);
            });
        var promise = AuthService.getSectores();
        promise.then(
            function (callback) {
                $scope.sectores = callback;
                //$scope.model.Pais = $scope.paises[0];
            },
            function (errorCallback) {
                console.log('Error: ', errorCallback);
            })
        var promise = AuthService.getGeneros();
        promise.then(
            function (callback) {
                $scope.generos = callback;
                //$scope.model.Pais = $scope.paises[0];
            },
            function (errorCallback) {
                console.log('Error: ', errorCallback);
            })
    };
    $scope.init();

    $scope.selectPais = function(criteria) {
        if ($scope.paises.length != 0) {
            var index = $scope.paises.map(function(d) {
                return d['Nombre'];
            }).indexOf(criteria);
            pais_elegido = $scope.paises[index];
            var promise2 = AuthService.getEstados(pais_elegido);
            promise2.then(
                function(callback) {
                    //console.log(callback);
                    $scope.estados = callback;
                },
                function(errorCallback) {
                    console.log('Error: ', errorCallback);
                });
        };

    };

    $scope.selectEstado = function (criteria) {
        if ($scope.estados.length != 0) {
            var index = $scope.estados.map(function(d) {
                return d['Nombre'];
            }).indexOf(criteria);
            estado_elegido = $scope.estados[index];
        }
    };

    $scope.selectSector = function (criteria) {
        if ($scope.sectores.length != 0) {
            var index = $scope.sectores.map(function(d) {
                return d['Nombre'];
            }).indexOf(criteria);
            sector_elegido = $scope.sectores[index];
        }
    };

    $scope.selectGenero = function (criteria) {
        if ($scope.generos.length != 0) {
            var index = $scope.generos.map(function(d) {
                return d['Nombre'];
            }).indexOf(criteria);
            genero_elegido = $scope.generos[index];
        }
    };


    $scope.submit = function(isValid){

        if (isValid) {
            //alert('our form is amazing');
            try{
                var y = document.getElementsByClassName('thumbnail')[0].currentSrc;

                $scope.resultado.foto = y;
                console.log($scope.resultado.foto.substr(1,20).includes("png"));
                if($scope.resultado.foto.substr(1,20).includes("png")){
                    $scope.resultado.extension = "png";
                }else{
                    $scope.resultado.extension = "gif";
                }
            }catch (e){

            }

            $scope.resultado.pais = pais_elegido;
            $scope.resultado.estado = estado_elegido;
            $scope.resultado.sector = sector_elegido;
            $scope.resultado.generoPropietario = genero_elegido;
            $scope.resultado.usuario = JSON.parse(localStorage.user);

            console.log($scope.resultado.usuario);

            var promise = AuthService.insertPYME($scope.resultado);
            promise.then(
                function(callback) {
                    console.log(callback);
                    localStorage.pyme = JSON.stringify(callback);
                    $location.path('regSocialNetworks').replace();
                },
                function(errorCallback) {
                    console.log('Error: ', errorCallback);
                });
            //console.log($scope.resultado);
        }



    };

    $('.imageupload').imageupload({
        allowedFormats: [ 'png','gif' ],
        maxFileSizeKb: 50
    });
});



function previewFile() {
    var preview = document.querySelector('img');
    var file = document.querySelector('input[type=file]').files[0];
    var reader = new FileReader();

    reader.onloadend = function() {
        preview.src = reader.result;
        imgsrc = reader.result;
        blob = reader.result;
    }

    if (file) {
        reader.readAsDataURL(file);
    } else {
        preview.src = "";
    }
};
