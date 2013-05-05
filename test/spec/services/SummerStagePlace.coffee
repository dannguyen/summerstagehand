'use strict'

describe 'Service: SummerStagePlace', () ->

  # load the service's module
  beforeEach module 'summerstagehandApp'

  # instantiate service
  SummerStagePlace = {}
  beforeEach inject (_SummerStagePlace_) ->
    SummerStagePlace = _SummerStagePlace_

  it 'should do something', () ->
    expect(!!SummerStagePlace).toBe true;
