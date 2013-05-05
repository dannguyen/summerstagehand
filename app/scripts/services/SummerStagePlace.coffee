'use strict';

yoapp = angular.module('summerstagehandApp')

yoapp.factory 'SummerStagePlaces', ['$resource', ($resource) ->
      $resource( "#{_DATA_PATH}/places/all.json", 
         {}, {get:
               method: 'GET'
               isArray: true
            }
         )
]

#TK:  todo, make this simpler, all in one thing?

yoapp.factory 'SummerStagePlace', ['$resource', ($resource) ->
   $resource( "#{_DATA_PATH}/places/:placeId.json", 
      {}, {get:
       		method: 'GET'
       		isArray: false
         }
      )
]


