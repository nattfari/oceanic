angular.module('Oceanic', ['ui.bootstrap', 'ngRoute'])

.controller('OceanicController', ['$scope', function ($scope) {

    $scope.image = {
        path: "img/logo.gif"
    };

    $scope.byer = ['Tanger', 'Tunis', 'Tripoli', 'Cairo', 'De Kanariske Øer', 'Marakesh', 'Sahara', 'Omdurman', 'Suakin', 'Dakar', 'Timbuktu', 'Wadai', 'Darfur', 'Addis Abeba', 'Kap Guardafui', 'Sierra Leone', 'Guldkysten', 'Slavekysten', 'Bahrel Ghazal', 'Victoriasøen', 'Zanzibar', 'Congo', 'Kabalo', 'St. Helena', 'Luanda', 'Mocambique', 'Victoriafaldene', 'Amatave', 'Kap St. Marie', 'Dragebjerget', 'Hvalbugten', 'Kapstaden'];
    $scope.lufthavne = ['Tanger', 'Tripoli', 'Cairo', 'Marrakesh', 'Suakin', 'Sierra Leone', 'Guldkysten', 'Darfur', 'Victoriasøen', 'Kap Guardafui', 'Kabalo', 'Luanda', 'St. Helena', 'Amatave', 'Hvalbugten', 'Dragebjerget', 'Kap St. Marie', 'Kapstaden'];
    $scope.dimensioner = [{ type: 'a', højde: 25, dybde: 60, bredde: 25 }, { type: 'b', højde: 40, dybde: 40, bredde: 40 }, { type: 'c', højde: 15, dybde: 100, bredde: 15 }, { type: 'd', højde: 20, dybde: 80, bredde: 20 }, { type: 'e', højde: 30, dybde: 50, bredde: 30 }];
    $scope.vaegtklasser = [{ type: 'a', min: 0, max: 999 }, { type: 'b', min: 1000, max: 4999 }, { type: 'c', min: 5000, max: 100000 }];
    $scope.prismatriks = [{ dimensionstype: 'a', vaegttype: 'a', pris: 40 }, { dimensionstype: 'a', vaegttype: 'b', pris: 48 }, { dimensionstype: 'a', vaegttype: 'c', pris: 56 }, { dimensionstype: 'a', vaegttype: 'd', pris: 64 }, { dimensionstype: 'a', vaegttype: 'e', pris: 80 }, { dimensionstype: 'b', vaegttype: 'a', pris: 60 }, { dimensionstype: 'b', vaegttype: 'b', pris: 68 }, { dimensionstype: 'b', vaegttype: 'c', pris: 76 }, { dimensionstype: 'b', vaegttype: 'd', pris: 84 }, { dimensionstype: 'b', vaegttype: 'e', pris: 100 }, { dimensionstype: 'c', vaegttype: 'a', pris: 80 }, { dimensionstype: 'c', vaegttype: 'b', pris: 88 }, { dimensionstype: 'c', vaegttype: 'c', pris: 96 }, { dimensionstype: 'c', vaegttype: 'd', pris: 104 }, { dimensionstype: 'c', vaegttype: 'e', pris: 120 }];
    $scope.tableVaerdier = [];

}])

.service('Api', function () {
    // For easy debugging when running localhost
    if (document.location.hostname.indexOf("localhost") !== -1) {
        this.root = 'http://localhost:59996/api';
        this.url = 'http://localhost:59996/';
    }
    else {
        this.root = 'http://oa.azurewebsites.com/api';
        this.url = 'http://oa.azurewebsites.com';
    }
})

.service('Parameters', function () {
    this.params = {};
    this.setParams = function(obj) {
        this.params = obj;
    };

    this.getParams = function() {
        return this.params;
    }
})

.config(['$routeProvider',
    function ($routeProvider) {
        $routeProvider.
            when('/Forside', {
                templateUrl: 'Scripts/templates/forside.html',
                controller: 'ForsideController'
            }).
            when('/FindRute', {
                templateUrl: 'Scripts/templates/FindRute.html',
                controller: 'FindRuteController'
            }).
            when('/Ruteforslag', {
                templateUrl: 'Scripts/templates/Ruteforslag.html',
                controller: 'RuteforslagController'
            }).
            when('/Ruteoversigt', {
                templateUrl: 'Scripts/templates/Ruteoversigt.html',
                controller: 'RuteoversigtController'
            }).
            when('/Priser', {
                templateUrl: 'Scripts/templates/priser.html',
                controller: 'PriserController'
            }).
            when('/Administration', {
                templateUrl: 'Scripts/templates/administration.html',
                controller: 'AdministrationController'
            }).
            otherwise({
                redirectTo: '/Forside'
            });
    }
]);