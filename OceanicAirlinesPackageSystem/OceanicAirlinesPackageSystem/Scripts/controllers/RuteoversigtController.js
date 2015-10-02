angular.module('Oceanic').controller('RuteoversigtController', [
    '$scope', 'userInteractionRepository', function ($scope, userInteractionRepository) {
        $scope.loading = true;
        userInteractionRepository.hentSoegninger().then(function(result) {
            $scope.Ruter = result;
            $scope.loading = false;
        }, function (error) {
            $scope.loading = false;
            $scope.errorMessage = "Kunne ikke hente ruter";
        });
    }
]);