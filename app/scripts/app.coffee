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
      .when '/fun',
        templateUrl: 'views/fun.html'
        controller: 'FunCtrl'
      .when '/calendar',
        templateUrl: 'views/calendar.html',
        controller: 'CalendarCtrl'
      .otherwise
        redirectTo: '/'
