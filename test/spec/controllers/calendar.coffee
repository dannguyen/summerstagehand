'use strict'

describe 'Controller: CalendarCtrl', () ->

  # load the controller's module
  beforeEach module 'yoSummerApp'

  CalendarCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, summerStageEvents) ->
    
    summerStageEvents.gofetch = () ->
      "nothing"

    scope = $rootScope.$new()

    CalendarCtrl = $controller 'CalendarCtrl', {
      $scope: scope
    }




  it 'should refresh the events listing', () ->
    scope.refreshCalendar("hi")
    expect(scope.events).toBe "hi"
