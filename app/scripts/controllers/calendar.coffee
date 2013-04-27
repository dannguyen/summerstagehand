'use strict'

angular.module('yoSummerApp')
	.controller 'CalendarCtrl', ($scope, summerStageEvents) ->

		$scope.events = []
		$scope.categories = []

		$scope.refreshCalendar = (data) ->
			$scope.categories = summerStageEvents.facet_categories()  # duh, not good
			$scope.events = data

		summerStageEvents.gofetch($scope.refreshCalendar) # get events, fills $scope.events

