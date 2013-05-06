'use strict';


yoapp = angular.module('summerstagehandApp')

###
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

]
###

yoapp.factory 'summerStageEvents', ['$resource', ($resource) ->
   
      $resource( "#{_DATA_PATH}/events/all.json", 
         {}, {get:
               method: 'GET'
               isArray: true,
               cache : true

            }
         )

]



yoapp.factory 'SummerEvent', ['$resource', ($resource) ->

   $resource( "#{_DATA_PATH}/events/:eventId.json", 
      {}, {query:
       		method: 'GET'
       		isArray: false
         }
      )
]


