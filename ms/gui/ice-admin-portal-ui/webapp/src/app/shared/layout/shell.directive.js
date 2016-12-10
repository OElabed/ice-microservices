angular.module('abs.coreLayout')
    .directive('appShell', function() {
        return {
            restrict: 'A',
            templateUrl: 'shared-views/shell.html',
            replace: true
        };
    });