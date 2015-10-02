angular.module('Oceanic').controller('ForsideController', [
    '$scope', 'userInteractionRepository', '$location', 'AuthService', function ($scope, userInteractionRepository, $location, AuthService) {
        $scope.user = {};
        $scope.doLogin = function () {
            userInteractionRepository.loginUser($scope.user).then(function (result) {
                $scope.loggedIn = result;
                if (result.Result) {
                    AuthService.username = $scope.user.Username;
                    AuthService.password = $scope.user.Password;
                    AuthService.isAuthenticated = true;

                    if (result.IsAdmin) {
                        AuthService.isAdmin = true;
                    }

                    $location.path("/FindRute");
                } else {
                    $scope.errorMessage = 'Forkert brugernavn eller password.';
                }
            }, function (result) {
                AuthService.username = "";
                AuthService.password = "";
                AuthService.isAuthenticated = false;
                $scope.error = true;
            });
        };
    }
]);