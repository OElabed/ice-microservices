angular.module('abs.home')
    .controller('HomeController', ['ProviderModelService', 'CustomerModelService',
        function(ProviderModelService, CustomerModelService) {
            var vm = this;

            ProviderModelService.providerIndex().then(function providerIndexResponse(response) {
                vm.providers = response.data;
            }, function providerIndexError(error) {
                vm.providers = error;
            });

            CustomerModelService.customerIndex().then(function customerIndexResponse(response) {
                vm.customers = response.data;
            }, function customerIndexError(error) {
                vm.customers = error;
            });
        }
    ]);