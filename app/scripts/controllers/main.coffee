'use strict'

angular.module('summerstagehandApp')
	.controller 'MainCtrl', ['$scope', '$rootScope', '$window', 'summerStageEvents', 'SummerStageVideos', '$timeout', ($scope, $rootScope, $window, summerStageEvents, SummerStageVideos, $timeout) ->



		$scope.events = summerStageEvents.get( {}, (data) ->
         $scope.events = data[0..10]         
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