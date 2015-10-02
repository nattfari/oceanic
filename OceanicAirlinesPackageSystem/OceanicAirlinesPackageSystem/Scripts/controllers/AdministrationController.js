angular.module('Oceanic').controller('AdministrationController',[
    '$scope', 'adminRepository', function ($scope, adminRepository) {

        adminRepository.getAdmin().then(function(result) {
            $scope.result = result;

        }, function(error) {
            $scope.error = true;
        });

        $scope.saveAdmin = function () {
            $scope.loading = true;
            adminRepository.saveAdmin($scope.result).then(function(result) {
                $scope.success = true;
                $scope.loading = false;
            }, function(error) {
                $scope.errorMessage = "Oops, something went wrong!";
                $scope.loading = false;
            });
        }
    }
]);