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
        }
    };
});
