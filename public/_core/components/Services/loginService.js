app.factory('AuthService', function($q, $log, $http) {
    return {

        getPaises: function() {
            var deferred = $q.defer();

            $http.get('/api/users/getPaises')
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },
        getEstados: function(model) {
            var deferred = $q.defer();

            $http.post('/api/users/getEstados', model)
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },getSectores: function() {
            var deferred = $q.defer();

            $http.get('/api/users/getSectores')
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },getGeneros: function() {
            var deferred = $q.defer();

            $http.get('/api/users/getGeneros')
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },insertUsuario: function(model) {
            var deferred = $q.defer();

            $http.post('/api/users/insertUsuario', model)
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },insertPYME: function(model) {
            var deferred = $q.defer();

            $http.post('/api/users/insertPYME', model)
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },insertRedesSociales: function(model) {
            var deferred = $q.defer();

            $http.post('/api/users/insertRedesSociales', model)
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },validarSesion: function(model) {
            var deferred = $q.defer();

            $http.post('/api/users/validarSesion', model)
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        },updatePYME: function(model) {
            var deferred = $q.defer();

            $http.post('/api/users/updatePYME', model)
                .success(function(data) {
                    deferred.resolve(data);
                }).error(function(msg, code) {
                deferred.reject(msg);
                $log.error(msg, code);
            });
            return deferred.promise;
        }

    };
});
