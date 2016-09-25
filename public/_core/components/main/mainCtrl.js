app.controller('mainCtrl', function ($scope, $http, $timeout, $location, AuthService) {

    var pagePostId = '';
    var pageAccessToken = '';

    $scope.init = function(){
        $scope.usuario = JSON.parse(localStorage.userinfo)[0];
        console.log($scope.usuario);
        $scope.usuario.facebook = $scope.usuario.facebookApp.data[0];
        $scope.faceVerde = false;
        $scope.faceNaranja = true;
    }
    $scope.init();

    window.fbAsyncInit = function() {
        FB.init({
            appId: '309465172741245',
            xfbml: true,
            version: 'v2.7'
        });

        //Aquí puedo meter los métodos para correr al principio. No se pueden abrir dialogs sin botón
    };

    (function(d, s, id) {
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
            /*var promise = AuthService.updateFacebook($scope.usuario);
            promise.then(
                function(callback) {
                    console.log(callback);

                },
                function(errorCallback) {
                    console.log('Error: ', errorCallback);
                });*/
            $scope.faceVerde = true;
            $scope.faceNaranja = false;
            $scope.$apply();
            console.log("Cambio---------");
            getPagesFromUser();
        } else if (response.status === 'not_authorized') {
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        } else {
            document.getElementById('status').innerHTML = 'Please log ' +
                'into Facebook.';
        }
    }

    $scope.openLoginDialog = function() {
        FB.login(function(response) {
            checkLoginState();
        }, {
            scope: 'public_profile, manage_pages, publish_pages'
        });
    }

    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    function getUserName() {
        FB.api('/me', function(response) {
            document.getElementById('resultadoLogin').innerText =
                '¡Ahora su sesión se encuentra iniciada: ' + response.name + '!';
        });
    }
    
    function getPagesFromUser() {
        FB.api('/me/accounts', function(response){
            console.log(response);
            document.getElementById("pagAdministradas").innerText =
                'Las páginas administradas son: \n' + response.data[0].name;
            pagePostId = response.data[0].id;
            pageAccessToken = response.data[0].access_token;
            console.log(response);
        })
    }

    $scope.postOnWall = function() {

        FB.api('/' + pagePostId + '/feed', 'post',
            {
                access_token: pageAccessToken,
                message     : ".......A todos nuestros seguidores, les pedimos llenar esta encuesta. Gracias. \n Siga el siguiente link: http://localhost/registro/?varID="+$scope.usuario.pymeID,
                //link        : 'http://localhost/registro/',
                to: pagePostId,
                from: pagePostId
            },
            function(response) {
                if (response && !response.error) {
                    console.log("PUBLICADO");
                    alert("La publicación se hizo correctamente.");
                    var promise = AuthService.updateFacebook($scope.usuario);
                    promise.then(
                        function(callback) {
                            console.log(callback);
                            $scope.faceVerde = false;
                            $scope.usuario.facebookApp.data[0] = !$scope.usuario.facebookApp.data[0];
                            localStorage.userinfo = JSON.stringify([$scope.usuario]);
                        },
                        function(errorCallback) {
                            console.log('Error: ', errorCallback);
                        });
                    console.log(response);

                } else {
                    console.log("ERROR AL PUBLICAR");
                    alert("Ocurrio un error al publicar. Intente de nuevo.");
                    console.log(response);
                }
            });
    }

});