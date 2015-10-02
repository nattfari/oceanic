angular.module('Oceanic').controller('AdministrationController',[
    '$scope', '$http', 'Api', 'adminRepository', function ($scope, $http, Api, adminRepository) {

        $http.get(Api.url + 'internal/administration').then(function(response) {
            $scope.result = response.data;
        }, function(error) {
            $scope.error = true;
        });

        $scope.saveAdmin = function() {
            $scope.loading = true;

            $http.post(Api.url + 'internal/administration', $scope.result).then(function(response) {
                $scope.success = true;
                $scope.loading = false;
            }, function(error) {
                $scope.errorMessage = "Oops, noget gik galt";
                $scope.loading = false;
            });
        };
        //adminRepository.getAdmin().then(function(result) {
        //    $scope.result = result;

        //}, function(error) {
        //    $scope.error = true;
        //});

        //$scope.saveAdmin = function () {
        //    $scope.loading = true;
        //    adminRepository.saveAdmin($scope.result).then(function(result) {
        //        $scope.success = true;
        //        $scope.loading = false;
        //    }, function(error) {
        //        $scope.errorMessage = "Oops, something went wrong!";
        //        $scope.loading = false;
        //    });
        //}
    }
]);