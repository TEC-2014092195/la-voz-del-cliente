app.controller('registerCtrl', function($scope){
    $scope.init = function () {
        var promise = AuthService.getPaises();
        promise.then(
            function (callback) {
                $scope.paises = callback;
                $scope.model.Pais = $scope.paises[0];
            },
            function (errorCallback) {
                console.log('Error: ', errorCallback);
            })
    };
    $scope.paises = ['Costa Rica','Nicaragua','Colombia','Panamá'];
    $scope.estados = ['San José','Alajuela','Cartago','Heredia'];
    $scope.sectores = ['Ambiental','Banca','Comercio','Tecnológico'];
    $scope.generos = ['Masculino','Femenino','No Indica'];

    $scope.submit = function(){
        $scope.resultado.foto = blob;
        console.log($scope.resultado);

    };

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
