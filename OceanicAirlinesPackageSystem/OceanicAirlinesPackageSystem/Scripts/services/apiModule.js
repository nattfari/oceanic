angular.module('apiModule', []).service('Api', function () {
    // For easy debugging when running localhost
    if (document.location.hostname.indexOf("localhost") !== -1) {
        this.root = 'http://localhost:59996/api';
        this.url = 'http://localhost:59996/';
    }
    else {
        this.root = 'http://oa.azurewebsites.com/api';
        this.url = 'http://oa.azurewebsites.com';
    }
});