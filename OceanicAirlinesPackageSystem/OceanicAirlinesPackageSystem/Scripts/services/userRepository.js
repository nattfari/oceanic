﻿angular.module('Oceanic').factory('userInteractionRepository', [
    '$http', '$q', 'Api', function($http, $q, Api) {
        return {
            createUser: function(user) {
                var deferred = $q.defer();
                $http({
                    url: Api.root + '/user/create',
                    method: "POST",
                    data: user
                }).success(deferred.resolve).error(deferred.reject);
                return deferred.promise;
            },
            loginUser: function(user) {
                var deferred = $q.defer();
                $http({
                    url: Api.root + '/user/login',
                    method: "POST",
                    data: user
                }).success(deferred.resolve).error(deferred.reject);
                return deferred.promise;
            }
        }
    }
]);