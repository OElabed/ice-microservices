absConfig.pushAfterBootstrap('abs.helpFeature');

angular.module('abs.helpFeature')
    .config(['$stateProvider',
        function ($stateProvider) {
            $stateProvider
                .state('faq', {
                    url: '/faq',
                    controller: 'FaqPageController',
                    controllerAs: 'vm',
                    templateUrl: 'views/faq-page.html',
                    data: {
                        pageTitle: 'FAQ page',
                        pageDesc: 'FAQ page.'
                    }
                })
                .state('contact', {
                    url: '/contact',
                    controller: 'ContactPageController',
                    controllerAs: 'vm',
                    templateUrl: 'views/contact-page.html',
                    data: {
                        pageTitle: 'Contact page',
                        pageDesc: 'Contact page.'
                    }
                });
        }
    ]);