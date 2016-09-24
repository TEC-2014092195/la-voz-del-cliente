app.controller('homeCtrl', function ($scope, $timeout, $location, AuthService) {

    var promise = AuthService.getPaises();
    promise.then(
        function (callback) {
            $scope.paises = callback;
            console.log($scope.paises);
        },
        function (errorCallback) {
            console.log('Error: ', errorCallback);
        });
});
