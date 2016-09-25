app.controller('dashboardCtrl', function ($scope, $http, $timeout, $location) {

    var pagePostId = '';
    var pageAccessToken = '';

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
                message     : "ENCUESTA IMPORTANTE: Por favor, a todos nuestros seguidores, les pedimos llenar esta encuesta. Gracias. \n Siga el siguiente link: http://localhost/registro/",
                //link        : 'http://localhost/registro/',
                to: pagePostId,
                from: pagePostId
            },
            function(response) {
                if (response && !response.error) {
                    console.log("PUBLICADO");
                    console.log(response);
                } else {
                    console.log("ERROR AL PUBLICAR");
                    console.log(response);
                }
            });
    }

});