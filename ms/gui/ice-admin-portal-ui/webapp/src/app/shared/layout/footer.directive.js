angular.module('abs.coreLayout')
    .directive('appFooter', function() {
        return {
            restrict: 'A',
            templateUrl: 'shared-views/footer.html',
            controller: 'LayoutController',
            controllerAs: 'vm',
            replace: true
        };
    });