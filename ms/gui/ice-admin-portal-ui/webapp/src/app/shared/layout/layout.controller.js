angular.module('abs.coreLayout')
    .controller('LayoutController', ['$filter',
        function($filter) {
            var vm = this;
            var localCurrentDate = new Date();
            vm.currentDate = $filter('date')(localCurrentDate, 'yyyy');
        }
    ]);