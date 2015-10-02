angular.module('Oceanic').controller('RuteforslagController', [
    '$scope', '$http', 'Api', 'Parameters', 'userInteractionRepository', function ($scope, $http, Api, Parameters, userInteractionRepository) {
        $scope.result = {
            success: false,
            notFound: false,
            waiting: true,
            error: false
        };
        $scope.fragtTyper = Parameters.getFragtTyper() || [];
        $scope.request = {};
        $scope.Ruter = [];
        sendRequest = function() {
            $scope.request = Parameters.getParams();
            console.log($scope.request);
            $http.post(Api.url + 'rute/soeg', $scope.request).then(function (response) {
                console.log(response);
                if (response.status == 200) {
                    $scope.result.waiting = false;
                    if (response.data.Ruter.length > 0) {
                        $scope.result.success = true;
                        $scope.Ruter = response.data.Ruter;
                    } else {
                        $scope.result.success = false;
                    }
                }
            }, function(response) {
                $scope.result.waiting = false;
                $scope.result.error = true;
            })
        };
        sendRequest();

        $scope.filterFragt = function(item) {
            return ($scope.request.FragtTyper.indexOf(item.Id) !== -1);
        };

        $scope.ruteDTO = {
            RuteType: "EnType",
            TotalTid: 200,
            TotalPris: 10,
            RuteTrin: []
        };

        $scope.gemSoegning = function (rute) {
            var id = rute.RuteId;
            rute.loading = true;
            userInteractionRepository.gemSoegning(id).then(function(result) {
                rute.saved = true;
                rute.loading = false;
            }, function(error) {
                $scope.error = true;
            });
        }
    }
]);