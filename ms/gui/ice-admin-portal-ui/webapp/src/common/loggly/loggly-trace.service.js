/**
  * Service that gives us a nice Angular-esque wrapper around the
  * stackTrace.js pintStackTrace() method.
  *
  */
angular.module('abs.commonLoggly')
    .factory("traceService", function() {
        return ({
            print: printStackTrace
        });
    });