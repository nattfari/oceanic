angular.module('Oceanic').controller('RuteforslagController', [
    '$scope', '$http', 'Api', 'Parameters', function ($scope, $http, Api, Parameters) {
        $scope.result = {
            success: undefined
        }
        $scope.fragtTyper = Parameters.getFragtTyper() || [];
        $scope.request = {};
        sendRequest = function() {
            $scope.request = Parameters.getParams();
            console.log($scope.request);
            $http.post(Api.url + 'rute/soeg', $scope.request).then(function (response) {
                console.log(response);
                if (!response.data.Ruter.length > 0) {
                    $scope.result.success = false;
                } else {
                    $scope.result.success = true;
                }
            })
        };
        sendRequest();

        $scope.filterFragt = function (item) {
            return ($scope.request.FragtTyper.indexOf(item.Id) !== -1);
            //var retArray = [];
            //if ($scope.request.FragtTyper.indexOf(item.Id) !== -1) {
            //    retArray.push(item);
            //}
            //return retArray;
        }

        $scope.result = {
            success: true
        };

        $scope.ruteDTO = {
            RuteType: "EnType",
            TotalTid: 200,
            TotalPris: 10,
            RuteTrin: []
        };
    }
]);