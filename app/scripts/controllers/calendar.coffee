'use strict'

angular.module('summerstagehandApp')
	.controller 'CalendarCtrl', ['$scope', 'summerStageEvents', 'filterService', 
	($scope, summerStageEvents, filterService) ->

		$scope.filterService = filterService
		$scope.events = []
		$scope.categories = []



		#default
		$scope.orderProp = 'start_time'

		$scope.$watch "events", () ->
			console.log "HEY: #{$scope.events.length}"
			, true

		$scope.runIsotope = () -> 
			console.log "running isotope!"
			
			jQuery(".calendar").isotope( 
				{ itemSelector : '.item',  filter: '.active'} 
			)
			
			console.log "ran isotope already!"
	

		$scope.resetFilters = () ->
			filterService.resetAll()

		# passes clicked-on facet, cat to filterService
		$scope.filterToggle = (filter_name, filter_type) ->
			filterService.set_filter(filter_name, filter_type)
			_.delay () -> 
				$scope.runIsotope()
			, 100

		# wrapper for dom controls
		$scope.isActiveControl = (f_name, f_type) -> 
		# if no filters set, then just return false
			return false if !filterService.hasAnyFiltersSet()
			filterService.isActiveInFilterSet(f_name, f_type)

		$scope.refreshCalendar = (data) ->
			$scope.events = data
#			for event, idx in $scope.events  TODO: make this read from attributes
			$scope.filterService.facetPluck $scope.events, 'categories'
			$scope.filterService.facetPluck $scope.events, 'borough'
			$scope.filterService.facetPluck $scope.events, 'features'

		summerStageEvents.gofetch($scope.refreshCalendar) # get events, fills $scope.events

#		$scope.$watch $scope.events, () ->
#			console.log "HEY: #{$scope.events.length}"


]