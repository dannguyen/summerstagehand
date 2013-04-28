'use strict'

angular.module('yoSummerApp')
	.controller 'CalendarCtrl', ['$scope', 'summerStageEvents', 'filterService', 
	($scope, summerStageEvents, filterService) ->

		$scope.filterService = filterService
		$scope.events = []
		$scope.categories = []

		#default
		$scope.orderProp = 'start_time'

		$scope.resetFilters = () ->
			filterService.resetAll()

		# passes clicked-on facet, cat to filterService
		$scope.filterToggle = (filter_name, filter_type) ->
		#	console.log("filterToggle: #{filter_name}, inside of: #{filter_type}")
			filterService.set_filter(filter_name, filter_type)

		# wrapper for dom controls
		$scope.isActiveControl = (f_name, f_type) -> 
		# if no filters set, then just return false
			return false if !filterService.hasAnyFiltersSet()
			filterService.isActiveInFilterSet(f_name, f_type)

		$scope.refreshCalendar = (data) ->
			$scope.events = data
			$scope.filterService.facetPluck $scope.events, 'category'
			$scope.filterService.facetPluck $scope.events, 'sub_category'
			$scope.filterService.facetPluck( $scope.events, 'num', (i) -> 
				if i.id % 2 == 0
					'even'
				else
					'odd'
			)
		summerStageEvents.gofetch($scope.refreshCalendar) # get events, fills $scope.events

]