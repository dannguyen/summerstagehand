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

		$scope.events = summerStageEvents.get( {}, (data) ->
			$scope.events = data
			$scope.filterService.facetPluck $scope.events, 'categories'#, 'dropdown'
			$scope.filterService.facetPluck $scope.events, 'borough'#, 'dropdown'
			$scope.filterService.facetPluck $scope.events, 'features'#, 'checkbox'

			$scope.checkBoxes = []
			$scope.dropBoxes = []

			$scope.checkBoxes << $scope.filterService # todo!!!

			)




]