'use strict'

angular.module('summerstagehandApp')
	.controller 'MainCtrl', ['$scope', '$rootScope', '$window', 'featuredSummerStageEvents', 'SummerStageVideos', '$timeout', ($scope, $rootScope, $window, featuredSummerStageEvents, SummerStageVideos, $timeout) ->



		$scope.events = featuredSummerStageEvents.get( {}, (data) ->
#         console.log data.length
         $scope.events = _.reject data, (d) -> _.isEmpty d.feature_thumbnail
         $scope.events =  _.sortBy( _.shuffle($scope.events)[0..11], 'start_time')         
         
      )

      $rootScope.noContainer = true

]
