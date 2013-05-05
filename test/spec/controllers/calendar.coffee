'use strict'

describe 'Controller: CalendarCtrl', () ->

  # load the controller's module
  beforeEach module 'summerstagehandApp'

  CalendarCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope, summerStageEvents) ->
    
    scope = $rootScope.$new()

    CalendarCtrl = $controller 'CalendarCtrl', {
      $scope: scope
    }

