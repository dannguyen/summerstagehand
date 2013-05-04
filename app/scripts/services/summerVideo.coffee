'use strict';

angular.module('summerstagehandApp')
  .factory 'SummerVideo', () ->
    # Service logic
    # ...

    videoData = []


    vidmock = {
         id: "#{Math.round(Math.random(100) * 100)}"
         name: "A Video #{Math.round(Math.random(100) * 100)}"
         youtube_id: "A1QL_7hrIEI"
         description: "Lorem ipsum lasdf Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas, veniam, numquam asperiores eaque ipsum vero illum libero molestiae inventore temporibus repellat nam! Pariatur, eveniet." }

    vidmock.youtube_embed_url = "http://www.youtube.com/embed/#{vidmock.youtube_id}?rel=0&theme=light&autoplay=1"



    videoData.push vidmock 

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
