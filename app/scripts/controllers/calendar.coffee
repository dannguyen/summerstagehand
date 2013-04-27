'use strict'

angular.module('yoSummerApp')
	.controller 'CalendarCtrl', ($scope, summerStageEvents) ->

		$scope.events = []
		$scope.categories = []

		$scope.refreshCalendar = (data) ->
			$scope.events = data
			$scope.categories = summerStageEvents.facet_categories()  # duh, not good

		summerStageEvents.gofetch($scope.refreshCalendar) # get events, fills $scope.events

