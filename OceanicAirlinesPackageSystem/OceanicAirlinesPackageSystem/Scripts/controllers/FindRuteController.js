angular.module('Oceanic').controller('FindRuteController', [
    '$scope', 'Api', '$http', 'Parameters', function ($scope, Api, $http, Parameters) {

        $scope.byer = [];
        $scope.hentByer = function() {
            $http.get(Api.url + 'internal/cities').then(function(response) {
                $scope.byer = response.data.cities;
                console.log(response);
            });
        };
        $scope.hentByer();

        $scope.rute = {FragtTyper:[]};

        $scope.findRute = function () {
            console.log("Finder Rute");
            console.log($scope.rute);
            Parameters.setParams($scope.rute);
            window.location.href = '#Ruteforslag';
        };

        $scope.fragtTyper = [{ id: "1", "name": "Våben" }, { id: "2", name: "Levende Dyr" }, { id: "3", name: "Forsigtig" }];

        $scope.valgteTyper = function(fragtType) {
            if (fragtType.markeret) {
                $scope.rute.FragtTyper.push(fragtType.id);
            } else {
                var index = $scope.rute.FragtTyper.indexOf(fragtType.id);
                $scope.rute.FragtTyper.splice(index, 1);
            }
        };

        serialize = function (obj) {
            var str = [];
            for (var p in obj) {
                if (obj.hasOwnProperty(p)) {
                    str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
                }
            }
            return str.join("&");
        }
    }
]);