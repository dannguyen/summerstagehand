'use strict'

angular.module('summerstagehandApp')
	.controller 'MainCtrl', ['$scope', '$rootScope', '$window', 'featuredSummerStageEvents', 'SummerStageVideos', '$timeout', ($scope, $rootScope, $window, featuredSummerStageEvents, SummerStageVideos, $timeout) ->



		$scope.events = featuredSummerStageEvents.get( {}, (data) ->
         console.log data.length
         $scope.events = _.sortBy(_.shuffle( data)[0..5], 'start_time')         
      )

      $rootScope.noContainer = true

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $scope.videoDataLoaded = true

         if $window.innerWidth < 500
            $scope.randomVideos = []            
         else if $window.innerWidth < 780
            $scope.randomVideos = _.shuffle($scope.videos)[0..19]
            
            
            $scope.ramaSize = 'small'
         else
            $scope.randomVideos = _.shuffle($scope.videos)[0..29]
            $scope.ramaSize = 'large'
]


#         $scope.randomVideo = $scope.videos[_.random($scope.videos.length)]

#         $scope.randomizeVideos()
###
      $scope.randomizeVideos = () ->
         $timeout( () ->
            $scope.showRandomVideo = false

            $scope.randomVideo = $scope.videos[_.random($scope.videos.length)]
            $scope.randomizeVideos()
            $scope.showRandomVideo = true
         , 1000
         )

      $scope.testFoo = (r) ->
         console.log(r)
###