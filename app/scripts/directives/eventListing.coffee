'use strict';

## not working
angular.module('summerstagehandApp')
  .directive('eventListing', () ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the eventListing directive'
  )

angular.module('summerstagehandApp')
	.directive('isotopeGrid', () ->
		template: '<div></div>'
		restrict: 'A'
		link: (scope, element, attrs) ->
			###
			$(element).isotope( { itemSelector : '.item', layoutMode : 'fitRows'},
				($items) ->
					console.log("isotoped #{$items.length} items")
			)
			###

	)


angular.module('summerstagehandApp')
	.directive('isotopeItem',['$timeout', ($timeout) ->
		link: (scope, element, attrs, controller) ->
			if attrs.ngRepeat && scope.$last == true
				element.ready () ->
					$timeout () -> 
						console.log("im the last!")
						scope.runIsotope()
	])			