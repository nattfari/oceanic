angular.module('Oceanic').controller('AdministrationController',[
    '$scope', function ($scope) {
        $scope.lufthavne =
            [{ navn: "Cairo", id: "1234", aktiveret: true },
            { navn: "Cairo2", id: "1234", aktiveret: true }];
    }
]);