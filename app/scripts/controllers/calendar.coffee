'use strict'

angular.module('yoSummerApp')
	.controller 'CalendarCtrl', ($scope, summerStageEvents) ->

		$scope.events = []

		$scope.refreshCalendar = (data) ->
			$scope.events = data

		summerStageEvents.gofetch($scope.refreshCalendar) # get events, fills $scope.events

