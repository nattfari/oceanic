angular.module('Oceanic').factory('AuthService', function () {

    var credentials = {
        username: '',
        password: '',
        isAuthenticated: false,
        isAdmin : false
    };

    return credentials;
});