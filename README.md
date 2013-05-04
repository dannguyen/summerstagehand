Readme fun
===============

TODO
(Saturday, Apr 27)
- Format calendar from events
- Create individual event calendar
- Allow clicking from back and forth
   - how do I persist global events object?
- Create folder of individual events data

TODO
May 3
Create the directive for videos to connect to SummerStageVideo.getDetails
   detaisl should include:
      youtube video id
      name
      description
      views
   directive should build the video display



   Change isotope directive to:
        $scope.$watch 'pagedInfiniteItems', () ->
         console.log("pageditems changed: #{$scope.pagedInfiniteItems.length} ")