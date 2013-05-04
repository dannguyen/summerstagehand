'use strict'

describe 'Controller: VideosCtrl', () ->

  # load the controller's module
  beforeEach module 'summerstagehandApp'

  VideosCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    VideosCtrl = $controller 'VideosCtrl', {
      $scope: scope
    }
