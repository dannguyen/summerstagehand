'use strict'

describe 'Filter: time strings', () ->

  # load the filter's module
  beforeEach module 'summerstagehandApp'

  # initialize a new instance of the filter before each test
  tfit = {}
  beforeEach inject ($filter) ->
    tfit.timeStringy = $filter 'timeStringy'
    tfit.readableDate = $filter 'readableDate'
    tfit.timeRangeMin = $filter 'timeRangeMin'
    tfit.filterParagraphs = $filter 'filterParagraphs'


  it 'should filter paragraphs', () ->
    expect(tfit.filterParagraphs "hello\nworld").toBe "<p>hello</p><p>world</p>"


  it 'should return a properly formatted standard time', () ->
    timeraw = "2013-08-30T01:00:00-04:00"
    timestr = "2013-08-30 01:00"
    expect(tfit.timeStringy timeraw).toBe timestr

  it 'should return a readableDate', () ->

    timeraw = "2013-04-07 12:00"
    timestr = "Sunday, Apr. 7"
    expect(tfit.readableDate timeraw).toBe timestr

    # no dot for June
    timeraw = "2013-06-01 12:00"
    timestr = "Saturday, June 1"
    expect(tfit.readableDate timeraw).toBe timestr

  it 'should return a proper range', () ->
    t1 = "2013-06-01 15:00"
    t2 = "2013-06-01 17:00"
    # expect(tfit.timeRangeMin [t1,t2]).toBe "3-5pm"
