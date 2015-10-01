angular.module('Oceanic').controller('FindRuteController', [
    '$scope', 'Api', '$http', function ($scope, Api, $http) {

        $scope.byer = [];
        $scope.hentByer = function() {
            $http.get(Api.url + 'internal/cities').then(function(response) {
                $scope.byer = response.data.cities;
                console.log(response);
            });
        };
        $scope.hentByer();

        $scope.rute = {fragtTyper:[]};

        $scope.findRute = function () {
            console.log("Finder Rute");
            console.log($scope.rute);
            $http.post(Api.url + 'rute/soeg', $scope.rute).then(function(response) {
                console.log(response);
                window.location.href = '#Ruteforslag'
            });
        };

        $scope.fragtTyper = [{ id: "1", "name": "Våben" }, { id: "2", name: "Levende Dyr" }, { id: "3", name: "Forsigtig" }];

        $scope.valgteTyper = function(fragtType) {
            if (fragtType.markeret) {
                $scope.rute.fragtTyper.push(fragtType.id);
            } else {
                var index = $scope.rute.fragtTyper.indexOf(fragtType.id);
                $scope.rute.fragtTyper.splice(index, 1);
            }
        };
    }
]);