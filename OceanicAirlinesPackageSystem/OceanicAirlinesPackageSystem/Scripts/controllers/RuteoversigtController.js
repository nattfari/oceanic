angular.module('Oceanic').controller('RuteoversigtController', [
    '$scope', 'userInteractionRepository', function ($scope, userInteractionRepository) {
        userInteractionRepository.hentSoegninger().then(function(result) {
            $scope.Ruter = result;
        }, function(error) {
            $scope.errorMessage = "Kunne ikke hente ruter";
        });
    }
]);