'use strict';


angular.module('yoSummerApp')
  	.service 'summerStageEvents', ['$http', ($http) ->
	  	EVENTS_DATA_URL = '/data/sample/events.json'

	  	event_array = []
	  	categories = []

	  	@gofetch = (success_foo, url=EVENTS_DATA_URL) ->

	  		$http.get(url).then (res) ->
	   		event_array = res.data
	   		console.log "In fetch,data length: #{event_array.length}"

	   		# get categories
	   		success_foo(event_array)

	   @facet_categories = () ->
	   	categories = _.chain(event_array)
	   		.countBy (event) -> 
	   			event.category
	   		.value()   
	   	console.log categories
	   	categories
	   		


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
