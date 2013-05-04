'use strict';

angular.module('summerstagehandApp')
  .factory 'SummerVideo', () ->
    # Service logic
    # ...

    videoData = [
      {
         name: "A Video",
         youtube_id: "QJ4tyowlVUM",
         description: "Lorem ipsum lasdf Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas, veniam, numquam asperiores eaque ipsum vero illum libero molestiae inventore temporibus repellat nam! Pariatur, eveniet."
      }
    ]

    # Public API here
    {
     
      # returns video data from my own service
      getDetails: (vid) ->
         # stub
         vid_data = videoData[0]
         vid_data.id = vid  
         vid_data # return this,

      getVideos: () ->
        # stub
        arr = []
        for i in [1..10]
          v =  _.clone videoData[0]
          v.name += " #{i}"
          v.description = _.shuffle( v.description.split(' ')).join(' ')
          arr.push v 
        arr 


    }
