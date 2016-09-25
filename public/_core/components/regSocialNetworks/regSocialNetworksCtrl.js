app.controller('regSocialNetworksCtrl', function ($scope, $timeout, $location) {
    $scope.resultado = {
        facebookDir: "",
        twitterDir: "",
        youtubeDir: "",
        siteDir: "",
        mailDir: ""
    }

    $scope.submit = function () {
        console.log($scope.resultado);
    }
});


