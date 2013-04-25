describe 'Services', () ->
    
    beforeEach module 'yoSummerApp'
    
    svc = "null"
    mockBackend = "null"
    
    # Initialize the controller and a mock scope
    beforeEach inject ($injector, _$httpBackend_, youtubeVid) ->
        
        svc = youtubeVid
        mockBackend = _$httpBackend_
        mockBackend.expectGET(svc.videoUrl('myvideo')).respond({entry:{id:'theid'}})
        

    it 'should have a videoUrl method', () ->
        expect(svc.videoUrl 'x').toBe "https://gdata.youtube.com/feeds/api/videos/x?v=2&alt=json";
        
    it 'should have fetchVideoData', () ->
        
        some_value = false
        myfoo = (data) -> 
            some_value = data.entry.id
            
        svc.fetchVideoData 'myvideo', myfoo
        mockBackend.flush()
        expect(some_value).toBe 'theid'
        
        
        


