app.controller('regSocialNetworksCtrl', function ($scope, $timeout, $location, AuthService) {
    $scope.resultado = {
        facebookDir: "",
        twitterDir: "",
        youtubeDir: "",
        siteDir: "",
        mailDir: "",
        linkedDir:""
    }

    $scope.cancel = function(){
        $location.path('home').replace();
    };

    $scope.submit = function (isValid) {

        if(isValid){
            $scope.resultado.pyme = JSON.parse(localStorage.pyme)[0].Id;
            var promise = AuthService.insertRedesSociales($scope.resultado);
            promise.then(
                function(callback) {
                    console.log(callback);
                    $location.path('login').replace();
                },
                function(errorCallback) {
                    console.log('Error: ', errorCallback);
                });
        }
    }
});


