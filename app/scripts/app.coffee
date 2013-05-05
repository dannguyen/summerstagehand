'use strict'

window._DATA_PATH = '/data-hold'

angular.module('summerstagehandApp', ['ngResource', 'ngSanitize'])
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
      .when '/calendar',
        templateUrl: 'views/calendar.html',
        controller: 'CalendarCtrl'
      .when '/videos',
        templateUrl: 'views/videos.html'
        controller: 'VideosCtrl'
      .when '/videos/:videoId',
        templateUrl: 'views/video-detail.html'
        controller: 'VideosCtrl'

      .when '/events/:eventId',
        templateUrl: 'views/event-detail.html'
        controller: 'EventDetailCtrl'
          
      .when '/places',
        templateUrl: 'views/places.html',
        controller: 'PlacesCtrl'
      .when '/places/:placeId',
        templateUrl: 'views/place-detail.html',
        controller: 'PlacesCtrl'

      .otherwise
        redirectTo: '/'




