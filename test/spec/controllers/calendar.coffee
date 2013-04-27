'use strict'

describe 'Controller: CalendarCtrl', () ->

  # load the controller's module
  beforeEach module 'yoSummerApp'

  CalendarCtrl = {}
  scope = {summerStageEvents: ''}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

    CalendarCtrl = $controller 'CalendarCtrl', {
      $scope: scope
      summerStageEvents: 
        gofetch: () ->
    }


  it 'should refresh the events listing', () ->
    scope.refreshCalendar("hi")
    expect(scope.events).toBe "hi"
