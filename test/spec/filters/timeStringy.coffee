'use strict'

describe 'Filter: time strings', () ->

  # load the filter's module
  beforeEach module 'summerstagehandApp', ['ngSanitize']

  # initialize a new instance of the filter before each test
  tfit = {}
  beforeEach inject ($filter) ->
    tfit.timeStringy = $filter 'timeStringy'
    tfit.readableDate = $filter 'readableDate'
    tfit.scheduledTimeMinimal = $filter 'scheduledTimeMinimal'
    tfit.convertParagraphs = $filter 'convertParagraphs'


  it 'should filter paragraphs', () ->
    expect(tfit.convertParagraphs "hello\nworld").toBe "<p>hello</p><p>world</p>"


  it 'should return a properly formatted standard time', () ->
    timeraw = "2013-08-30T01:00:00-04:00"
    timestr = "2013-08-30 01:00"
    expect(tfit.timeStringy timeraw).toBe timestr

  it 'should return a readableDate', () ->

    timeraw = "2013-04-07 12:00"    
    expect(tfit.readableDate timeraw).toBe timestr = "Apr. 7, Sunday"

    # no dot for June
    timeraw = "2013-06-01 12:00"
    expect(tfit.readableDate timeraw).toBe "June 1, Saturday"

  it 'should return a minimum range', () ->
    t1 = "2013-06-01 15:00"
    t2 = "2013-06-01 17:00"
    expect(tfit.scheduledTimeMinimal [t1,t2]).toBe "3-5pm"

  it 'should work across days', () ->
    t1 = "2013-06-01 15:00"
    t2 = "2013-06-02 01:00"
    expect(tfit.scheduledTimeMinimal [t1,t2]).toBe "3pm-1am"


  it 'should not return too minimum of a range', () ->
    t1 = "2013-06-01 08:00"
    t2 = "2013-06-01 17:00"
    expect(tfit.scheduledTimeMinimal [t1,t2]).toBe "8am-5pm"
