angular.module('Oceanic').controller('FindRuteController', [
    '$scope', function($scope, $filter) {

        $scope.rute = {fragtTyper:[]};
        $scope.byer = ['Tanger', 'Tunis', 'Tripoli', 'Cairo', 'De Kanariske Øer', 'Marakesh', 'Sahara', 'Omdurman', 'Suakin', 'Dakar', 'Timbuktu', 'Wadai', 'Darfur', 'Addis Abeba', 'Kap Guardafui', 'Sierra Leone', 'Guldkysten', 'Slavekysten', 'Bahrel Ghazal', 'Victoriasøen', 'Zanzibar', 'Congo', 'Kabalo', 'St. Helena', 'Luanda', 'Mocambique', 'Victoriafaldene', 'Amatave', 'Kap St. Marie', 'Dragebjerget', 'Hvalbugten', 'Kapstaden'];


        $scope.findRute = function() {
            console.log("Finder Rute");
            console.log($scope.rute);
        }


        $scope.fragtTyper = [{ id: "1", "name": "Våben" }, { id: "2", name: "Levende Dyr" }, { id: "3", name: "Forsigtig" }];
        $scope.valgteTyper = function (fragtType) {
            if (fragtType.markeret) {
                $scope.rute.fragtTyper.push(fragtType.id);
            } else {
                var index = $scope.rute.fragtTyper.indexOf(fragtType.id);
                $scope.rute.fragtTyper.splice(index, 1);
            }
        }
    }
]);