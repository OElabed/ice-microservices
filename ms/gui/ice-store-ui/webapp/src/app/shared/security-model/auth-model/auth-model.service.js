angular.module('abs.securityModel.authModel').factory('AuthModelService', authModelService);

authModelService.$inject = ['AUTH_ENDPOINT', 'LOGOUT_ENDPOINT', '$http', '$cookieStore'];

function authModelService(AUTH_ENDPOINT, LOGOUT_ENDPOINT, $http, $cookieStore) {
    var auth = {};
    auth.login = function (username, password) {
        return $http.post(AUTH_ENDPOINT, { username: username, password: password }).then(function (response, status) {
            console.log(status);
            auth.user = response.data;
            $cookieStore.put('user', auth.user);
            return auth.user;
        });
    };
    auth.logout = function () {
        return $http.post(LOGOUT_ENDPOINT).then(function (response) {
            console.log(response);
            auth.user = undefined;
            $cookieStore.remove('user');
        });
    };
    return auth;
}