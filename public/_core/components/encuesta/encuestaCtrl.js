app.controller('encuestaCtrl', function ($scope, $http,AuthService) {

    $http.get('_core/components/encuesta/basePreguntas.JSON')
        .then(function (res) {
            $scope.preguntas = res.data[0].preguntas;
            $scope.rangoEdades = res.data[0].edades;

        });
    $scope.opciones = [{id: 1, Nombre: 'Malo(a)' },
        {
            id: 2,
            Nombre: 'Regular'
        },
        {
            id: 3,
            Nombre: 'Normal'
        },{id: 4, Nombre: 'Bueno(a)' },
        {id: 5, Nombre: 'Excelente' }
    ];


    $scope.resultList = [];

    thisUserAccessToken = '';
    $scope.UserGender = '';

    $scope.submit = function (isValid) {
        console.log(isValid);
        if (isValid) {
            console.log($scope.resultList.questionsResult);

            var OpcionesNumeros=["","","","",""];
            for(var key in $scope.resultList.questionsResult) {
                if($scope.resultList.questionsResult[key] == "Malo(a)") {
                    OpcionesNumeros[key] = "1";
                }
                else if($scope.resultList.questionsResult[key] == "Regular") {
                    OpcionesNumeros[key] = "2";
                }else if($scope.resultList.questionsResult[key] == "Normal") {
                    OpcionesNumeros[key] = "3";
                }else if($scope.resultList.questionsResult[key] == "Bueno(a)") {
                    OpcionesNumeros[key] = "4";
                }else if($scope.resultList.questionsResult[key] == "Excelente") {
                    OpcionesNumeros[key] = "5";
                }
            }
            var OpcionesEdades = ["","","","",""];
            for(var key in $scope.resultList.questionsResult) {
                if($scope.resultList.ageResult[key] == "12-17") {
                    OpcionesEdades[key] = 1;
                }
                else if($scope.resultList.ageResult[key] == "18-33") {
                    OpcionesEdades[key] = 2;
                }else if($scope.resultList.ageResult[key] == "34-45") {
                    OpcionesEdades[key] = 3;
                }else if($scope.resultList.ageResult[key] == "46-55") {
                    OpcionesEdades[key] = 4;
                }else if($scope.resultList.ageResult[key] == "56-64") {
                    OpcionesEdades[key] = 5;
                }else if($scope.resultList.ageResult[key] == "65-73") {
                    OpcionesEdades[key] = 6;
                }else if($scope.resultList.ageResult[key] == "74+") {
                    OpcionesEdades[key] = 7;
                }

            }

            $scope.model={
                respuestas :"",
                fecha :"",
                genero :"",
                edad :""
            }

            $scope.model.respuestas = OpcionesNumeros;
            $scope.model.fecha = new Date();
            $scope.model.genero =  $scope.UserGender;
            $scope.model.edad =  $scope.resultList.ageResult[0];

            $scope.usuario = JSON.parse(localStorage.userinfo)[0];
            $scope.model.usuario =$scope.usuario;
            var promise = AuthService.insertRespuestas($scope.model);
            promise.then(
                function(callback) {
                    console.log(callback);

                },
                function(errorCallback) {
                    console.log('Error: ', errorCallback);
                });

        } else {
            alert("Faltan campos.");
            console.log("You failed");
        }
    }

    window.fbAsyncInit = function () {
        FB.init({
            appId: '309465172741245',
            xfbml: true,
            version: 'v2.7'
        });

        //Aquí puedo meter los métodos para correr al principio. No se pueden abrir dialogs sin botón
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function statusChangeCallback(response) {
        console.log(response);
        if (response.status === 'connected') {
            getUserName();
            alert("Sesión iniciada correctamente");
            $("#myModal").modal('hide').data('bs.modal', null);
        } else if (response.status === 'not_authorized') {
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        } else {
            document.getElementById('status').innerHTML = 'Please log ' +
                'into Facebook.';
        }
    }

    $scope.openLoginDialog = function () {
        FB.login(function (response) {
            thisUserAccessToken = response.authResponse.accessToken;
            checkLoginState();
        }, {
            scope: 'email, user_likes'
        });
    }

    function checkLoginState() {
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    }

    function getUserName() {
        FB.api('/me?fields:gender,email', function (response) {
            console.log('¡Ahora su sesión se encuentra iniciada: ' + response.name + '!');
            getGender();
        });
    }

    function getGender() {
        FB.api('/me', 'get', {access_token: thisUserAccessToken, fields: 'id,name,gender'}, function (response) {
            $scope.UserGender = response.gender;
            console.log($scope.UserGender);
        });
    }

    //Modal
    $(document).ready(function () {
        $("#myModal").modal({
            backdrop: 'static',
            keyboard: false
        });
    });

});

