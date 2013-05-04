'use strict'

describe 'Service: SummerStageVideo', () ->

   # load the service's module
   beforeEach module 'summerstagehandApp'

   # instantiate service
   SummerStageVideo = {}
   beforeEach inject (_SummerStageVideo_) ->
      SummerStageVideo = _SummerStageVideo_

   it 'should do something', () ->
      expect(!!SummerStageVideo).toBe true;


   it "should have getDetails", () ->
      vid = SummerStageVideo.getDetails(5)
      expect(vid.id).toBe 5
