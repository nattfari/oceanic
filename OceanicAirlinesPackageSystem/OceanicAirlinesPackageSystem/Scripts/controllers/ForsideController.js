angular.module('Oceanic').controller('ForsideController', [
    '$scope', 'userInteractionRepository', '$location', function ($scope, userInteractionRepository, $location) {
        $scope.user = {};
        $scope.doLogin = function () {
            userInteractionRepository.loginUser(user).then(function (result) {
                $scope.loggedIn = result;
                $location.path("/FindRute");
            }, function (result) {
                $scope.error = true;
            });
        };
    }
]);