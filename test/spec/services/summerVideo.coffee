'use strict'

describe 'Service: SummerVideo', () ->

   # load the service's module
   beforeEach module 'summerstagehandApp'

   # instantiate service
   SummerVideo = {}
   beforeEach inject (_SummerVideo_) ->
      SummerVideo = _SummerVideo_

   it 'should do something', () ->
      expect(!!SummerVideo).toBe true;


   it "should have getDetails", () ->
      vid = SummerVideo.getDetails(5)
      expect(vid.id).toBe 5
