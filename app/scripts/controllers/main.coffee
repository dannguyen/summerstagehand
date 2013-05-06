'use strict'

angular.module('summerstagehandApp')
	.controller 'MainCtrl', ['$scope', 'summerStageEvents', 'SummerStageVideos', '$timeout', ($scope, summerStageEvents, SummerStageVideos, $timeout) ->

		$scope.events = summerStageEvents.get( {}, (data) ->
         $scope.events = data[0..10]         
      )

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $scope.videoDataLoaded = true

         $scope.randomVideo = $scope.videos[_.random($scope.videos.length)]
         console.log($scope.randomVideo)

         $scope.randomizeVideos()

      $scope.randomizeVideos = () ->
         $timeout( () ->
            $scope.showRandomVideo = false

            $scope.randomVideo = $scope.videos[_.random($scope.videos.length)]
            $scope.randomizeVideos()
            $scope.showRandomVideo = true
         , 1000
         )


      $scope.addGoogleMap = (el_id, opts) ->
      ###  
         $scope.el_id = el_id
         $scope.mapOptions = opts
         # KRUFTY, TK

         $scope.mapfoo = mapService.buildMap
         google.maps.event.addDomListener(window, 'load', $scope.mapfoo);
      ###
      # add the map
      # $scope.addGoogleMap('map-container')
]
