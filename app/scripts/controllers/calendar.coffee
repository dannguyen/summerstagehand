'use strict'

angular.module('yoSummerApp')
	.controller 'CalendarCtrl', ['$scope', 'summerStageEvents', 'filterService', 
	($scope, summerStageEvents, filterService) ->

		$scope.filterService = filterService
		$scope.events = []
		$scope.categories = []



		#default
		$scope.orderProp = 'start_time'

		$scope.runIsotope = () -> 
			console.log "run isotope!"
			
			jQuery(".calendar").isotope( 
				{ itemSelector : '.item', layoutMode : 'fitRows', filter: '.active'} 
			)
			
			console.log "ran isotope!"
	

		$scope.resetFilters = () ->
			filterService.resetAll()

		# passes clicked-on facet, cat to filterService
		$scope.filterToggle = (filter_name, filter_type) ->
			filterService.set_filter(filter_name, filter_type)
			_.delay () -> 
				$scope.runIsotope()
			, 300

		# wrapper for dom controls
		$scope.isActiveControl = (f_name, f_type) -> 
		# if no filters set, then just return false
			return false if !filterService.hasAnyFiltersSet()
			filterService.isActiveInFilterSet(f_name, f_type)

		$scope.refreshCalendar = (data) ->
			$scope.events = data
			$scope.filterService.facetPluck $scope.events, 'category'
			$scope.filterService.facetPluck $scope.events, 'sub_category'
			

		summerStageEvents.gofetch($scope.refreshCalendar) # get events, fills $scope.events

#		$scope.$watch $scope.events, () ->
#			console.log "HEY: #{$scope.events.length}"


]