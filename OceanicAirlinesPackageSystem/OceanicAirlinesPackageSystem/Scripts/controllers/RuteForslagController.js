angular.module('Oceanic').controller('RuteforslagController', [
    '$scope', function ($scope) {
        $scope.result = {
            success: true
        };

        $scope.request = {
            FraBy: "Cairo",
            TilBy: "Sahara"
        };
    }
]);