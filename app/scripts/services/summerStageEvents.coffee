'use strict';


yoapp = angular.module('yoSummerApp')




yoapp.service 'summerStageEvents', ['$http', ($http) ->
	  	event_array = []
	  	categories = []

	  	# _DATA_PATH defined on window
	  	ALL_EVENTS_PATH = "#{_DATA_PATH}/events/all.json"

	  	@gofetch = (success_foo, url= ALL_EVENTS_PATH) ->

	  		$http.get(url).then (res) ->
	   		event_array = res.data
	   		console.log "In fetch,data length: #{event_array.length}"

	   		# get categories
	   		success_foo(event_array) if success_foo?

	   @facet_categories = () ->
	   	categories = _.chain(event_array)
	   		.countBy (event) -> 
	   			event.category
	   		.value()   
	   	categories
	   	
]


yoapp.factory 'SummerEvent', ['$resource', ($resource) ->


	 $resource("#{_DATA_PATH}/events/:eventId.json", {}, {
	 	query:
	 		method: 'GET'
	 		params:
	 			eventId: 'events'
	 		isArray: true

	 })


]


###
angular.module('yoSummerApp')
  .factory 'summerStageEvents', ($http) ->
    # Service logic
    # ...

    EVENTS_DATA_URL = '/data/sample/events.json'

    # Public API here
    {
      someMethod: () ->
        return meaningOfLife;

      fetch: () ->
      	[{name: "Event 1"}, {name: "Event 2"}]

      gofetch: (success_foo, url=EVENTS_DATA_URL) ->
      	$http.get(url).then (res) ->
      		console.log "In fetch,data length: #{res.data.length}"
      		success_foo(res.data)

    }
###

#	$scope.todos = $http.get( '/data/sample/sample.json')
#	.then (res) ->
#		$scope.todos = res.data
