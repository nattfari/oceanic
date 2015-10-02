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
        $scope.fragtTyper = Parameters.getFragtTyper();
        //$scope.hentFragtTyper = function() {
        //    $http.get(Api.url + 'internal/fragttyper').then(function(response) {
        //        $scope.fragtTyper = response.data.fragttyper;
        //        console.log(response);
        //    })
        //};
        //$scope.hentFragtTyper();

        $scope.rute = {FragtTyper:[]};

        $scope.findRute = function () {
            console.log("Finder Rute");
            Parameters.setParams($scope.rute);
            window.location.href = '#Ruteforslag';
        };

        $scope.valgteTyper = function(fragtType) {
            if (fragtType.markeret) {
                $scope.rute.FragtTyper.push(fragtType.Id);
            } else {
                var index = $scope.rute.FragtTyper.indexOf(fragtType.Id);
                $scope.rute.FragtTyper.splice(index, 1);
            }
        };
    }
]);