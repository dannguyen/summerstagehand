'use strict'

window._DATA_PATH = '/data-hold'

angular.module('yoSummerApp', ['ngResource'])
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
#        resolve: 
#          events: (summerStageEvents) ->
#            console.log("resolving somethin")
#            summerStageEvents.gofetch() # get events, fills $scope.events

      .when '/events/:eventId',
        templateUrl: 'views/event-detail.html'
        controller: 'EventDetailCtrl'
          
      .otherwise
        redirectTo: '/'




