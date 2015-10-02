angular.module('Oceanic').controller('RuteforslagController', [
    '$scope', '$http', 'Api', 'Parameters', function ($scope, $http, Api, Parameters) {
        $scope.result = {
            success: false,
            notFound: false,
            waiting: true
    }
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
                } else {
                    console.log("Noget gik i stykker");
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

        $scope.ruteDTO = {
            RuteType: "EnType",
            TotalTid: 200,
            TotalPris: 10,
            RuteTrin: []
        };
    }
]);