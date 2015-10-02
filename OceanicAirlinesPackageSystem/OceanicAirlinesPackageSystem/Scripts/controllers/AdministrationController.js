angular.module('Oceanic').controller('AdministrationController',[
    '$scope', 'adminRepository', function ($scope, adminRepository) {

        adminRepository.getAdmin().then(function(result) {
            $scope.result = result;

        }, function(error) {
            $scope.error = true;
        });

        $scope.saveAdmin = function() {
            adminRepository.saveAdmin($scope.result).then(function(result) {
                $scope.saved = true;
            }, function(error) {
                $scope.error = true;
            });
        }
    }
]);