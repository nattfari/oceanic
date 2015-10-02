angular.module('Oceanic').factory('userInteractionRepository', [
    '$http', '$q', 'Api', function($http, $q, Api) {
        return {
            createUser: function(user) {
                return $http({
                    url: Api.url + '/user/create',
                    method: "POST",
                    data: user
                });
            },
            loginUser: function(user) {
                return $http({
                    url: Api.url + '/user/login',
                    method: "POST",
                    data: user
                });
            },
            gemSoegning: function(id) {
                return $http({
                    url: Api.url + '/internal/gemSoegning',
                    method: "POST",
                    data: {
                        forsendelseId : id
                    }
                });
            },
            hentSoegninger: function () {
                return $http({
                    url: Api.url + 'rute/historik',
                    method: "GET"
                });
            }
        }
    }
]);
