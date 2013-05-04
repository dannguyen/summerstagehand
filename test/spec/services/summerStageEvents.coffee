'use strict'

describe 'Service: summerStageEvents', () ->

  # load the service's module
  beforeEach module 'summerstagehandApp'

  # instantiate service
  summerStageEvents = {}
  beforeEach inject (_summerStageEvents_) ->
    summerStageEvents = _summerStageEvents_

  it 'should do something', () ->
    expect(!!summerStageEvents).toBe true;
