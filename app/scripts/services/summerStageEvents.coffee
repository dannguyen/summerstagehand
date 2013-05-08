'use strict';


yoapp = angular.module('summerstagehandApp')


yoapp.factory 'summerStageEvents', ['$resource', ($resource) ->
   
      $resource( "#{_DATA_PATH}/events/all.json", 
         {}, {get:
               method: 'GET'
               isArray: true,
               cache : true

            }
         )

]


yoapp.factory 'featuredSummerStageEvents', ['$resource', ($resource) ->
   
      $resource( "#{_DATA_PATH}/events/featured.json", 
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


