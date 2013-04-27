'use strict'

angular.module('yoSummerApp', [])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/hot',
        templateUrl: 'views/hot.html'
        controller: 'HotCtrl'
      .when '/calendar',
        templateUrl: 'views/calendar.html',
        controller: 'CalendarCtrl'
      .when '/events',
        templateUrl: 'views/events.html',
        controller: 'EventsCtrl'
      .otherwise
        redirectTo: '/'
