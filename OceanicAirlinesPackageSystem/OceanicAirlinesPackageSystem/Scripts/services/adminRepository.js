angular.module('Oceanic').factory('adminRepository', [
    '$http', '$q', 'Api', function($http, $q, Api) {
        return {
            getAdmin: function() {
                var deferred = $q.defer();
                $http({
                    url: Api.url + 'internal/hentAdministration',
                    method: "GET"                    
                }).success(deferred.resolve).error(deferred.reject);
                return deferred.promise;
            },
            saveAdmin: function(administrator) {
                var deferred = $q.defer();
                $http({
                    url: Api.url + '/internal/administration',
                    method: "POST",
                    data: administrator
                }).success(deferred.resolve).error(deferred.reject);
                return deferred.promise;
            }
        }
    }
]);