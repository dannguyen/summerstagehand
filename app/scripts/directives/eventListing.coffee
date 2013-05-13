'use strict';



angular.module('summerstagehandApp')
  .directive('eventBlurb', () ->
    template: """<div>



 <div class="tk-event">
      <div class="datetime" style="color: #bbb">
        {{[event.start_time, event.end_time] | standardTimeMinimal }}
     </div>


      <div>{{event.place_name}}, {{event.borough}} </div>

<div><strong>{{event.category_list.join(', ')}}:</strong> 
   <a ng-href="/#/events/{{event.id}}"> 
     {{event.name}}  
  </a> 

</div>
</div> <!--tk-event-->



</div>"""
    restrict: 'E'
    link: (scope, element, attrs) ->
  )












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