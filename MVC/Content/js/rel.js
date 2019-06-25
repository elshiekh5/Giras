// ---------iridium html5 template -----------
// ---------created for pixelglimpse----------
// -------author : gokul raghu aka AJ---------
// -----------version 1.0---------------------
// ------------created on 14-july-2014--------
     //shop Owl for releted items    
        $(".related_owl").owlCarousel({
          autoPlay:20000, //Set AutoPlay to 5 seconds
          autoHeight : true,
          slideSpeed:400,
          singleItem:false,
          navigation: false,
          pagination: false,
          items : 4,
          itemsDesktop : [1199,4],
          itemsDesktopSmall : [979,4]
        });  
        var owl = $(".related_owl");
         // Custom Navigation Events
         $(".next-r").click(function(){
         owl.trigger('owl.next');
          })
         $(".prev-r").click(function(){
          owl.trigger('owl.prev');
          })   

