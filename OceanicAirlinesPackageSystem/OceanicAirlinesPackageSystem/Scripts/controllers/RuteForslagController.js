angular.module('Oceanic').controller('RuteforslagController', [
    '$scope', '$http', 'Api', 'Parameters', function ($scope, $http, Api, Parameters) {
        $scope.result = {
            success: undefined
        }
        $scope.request = {};
        sendRequest = function() {
            $scope.request = Parameters.getParams();
            console.log($scope.request);
            $http.post(Api.url + '/rute/soeg', $scope.request).then(function (response) {
                if (!response.data.ruter.length == 0) {
                    $scope.result.success = false;
                } else {
                    $scope.result.success = true;
                }
                console.log(response);
            })
        };
        sendRequest();

        $scope.result = {
            success: true
        };

        $scope.request = {
            FraBy: "Cairo",
            TilBy: "Sahara"
        };

        $scope.ruteDTO = {
            RuteType: "EnType",
            TotalTid: 200,
            TotalPris: 10,
            RuteTrin: []
    }
    }
]);