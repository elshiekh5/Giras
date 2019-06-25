
/*global $:false */
/*global window: false */

(function(){
  "use strict";

/*-----------------------------------------------------
                    pre loader init
-------------------------------------------------------*/
  $('body').jpreLoader({
    splashID: "#jSplash",
    loaderVPos: '40%',
    autoClose: true
  });
/*-----------------------------------------------------
animation
-------------------------------------------------------*/

$(function ($) {
    //ANIMATED ELEMENTS TRIGGERING
 if (!device.tablet() && !device.mobile()){
      
        $('.animated').appear(function() {
         $(this).each(function(){ 
            $(this).css('visibility','visible');
            $(this).addClass($(this).data('fx'));
           });
        },{accY: -200});
       }

       else {
        $('.animated').each(function(){ 
          $(this).removeClass('animated');
       });
       }

}); 
/*-----------------------------------------------------
Viewport Adjuter
-------------------------------------------------------*/
$(function ($) {

    var viewportHeight = $(window).height();
    //$('.splash-section, .autoheight').css('height',viewportHeight);
    $('.splash-section, .autoheight').css('height',viewportHeight/1);
    $('.autoheight-normal').css('height',viewportHeight/1);

              var parent_height = $('.splash-section').height();
              // alert(parent_height);
              var image_height = $('.vertical-center').height();
              var top_margin = (parent_height)/15;
              // normal row
              var parent_height_normal = $('.autoheight').height();
              var top_margin_normal = (parent_height_normal)/5;
              var add_margin_normal = (parent_height_normal)/5;
             
              //center it
              $('.vertical-center').css( 'padding-top', top_margin);
              //uncomment the following if ithe element to be centered is an image
              $('.vertical-center').css( 'margin-top' , top_margin);
              //center it normal
              $('.vertical-center-normal').css( 'padding-top' , top_margin_normal);
              $('.vertical-center-add').css( 'padding-top' , add_margin_normal);
              //uncomment the following if ithe element to be centered is an image
              $('.vertical-center-img-normal').css( 'margin-top' , top_margin_normal);

});


/*-----------------------------------------------------
                 Owl Carousel inits
------------------------------------------------------*/
$(document).ready(function() {
//Homepage Owl
$('#navigation_right').waypoint('sticky');

        $(".owl_head").owlCarousel({
          autoPlay:14000, //Set AutoPlay to 5 seconds
          autoHeight : false,
          singleItem:true,
          navigation: false,
          pagination: false,
        });

      var owl = $(".owl_head");
         // Custom Navigation Events
         $(".next").click(function(){
         owl.trigger('owl.next');
          })
         $(".prev").click(function(){
          owl.trigger('owl.prev');
          })
    // owl team
          $(".owl_events").owlCarousel({
          autoPlay:12000, //Set AutoPlay to 5 seconds
          autoHeight : true,
          singleItem:false,
          navigation: false,
          pagination: true,
          items:2,
          itemsMobile : [1199, 1]

          
        });
    // owl advice
          $(".owl_advice").owlCarousel({
          autoPlay:12000, //Set AutoPlay to 5 seconds
          autoHeight : true,
          singleItem:false,
          navigation: false,
          pagination: true,
          items:1,
          itemsMobile : [1199, 1],
          
        });		
    // parallax home owl
          $(".para_owl").owlCarousel({
          autoPlay:5000, //Set AutoPlay to 5 seconds
          autoHeight : false,
          singleItem:true,
          navigation: false,
          pagination: false,
          transitionStyle: 'goDown',
          items:1,
          itemsMobile : [600, 1]

        });
	//News Owl     
        $(".news_owl").owlCarousel({
          autoPlay:5000, //Set AutoPlay to 5 seconds
          autoHeight : true,
          slideSpeed:400,
          singleItem:true,
          navigation: false,
          pagination: true,
          navigationText: ["",""]
        });
	//Testimonial Owl     
        $(".testimonials_owl").owlCarousel({
          autoPlay:15000, //Set AutoPlay to 5 seconds
          autoHeight : true,
          slideSpeed:400,
          singleItem:true,
          navigation: false,
          pagination: true,
          navigationText: ["",""]
        }); 
 
});  

/*-----------------------------------------------------
           port nav btn effect
------------------------------------------------------*/ 

$('.port-nav #menu .port-hover').hover(function(){
  $(".port-ico-img i").addClass("icon-color-active");
  // $(".port-nav #menu .sub-menu").fadeIn(800);
  },function(){
  $(".port-ico-img i").removeClass("icon-color-active");
  // $(".port-nav #menu .sub-menu").fadeOut(800);
}); 


// -----------------feather popup---------------
$('.myElement').featherlight({
    targetAttr: 'href',     
    openSpeed: 700,
    closeSpeed: 700
});
// ------------------slick nav mob menu--------------------
$(document).ready(function(){
  $('#menu').slicknav({
   duration :'1000' 
    });
  });
// ---------------------------paraent close-------------------------------------
})();


/*-----------------------------------------------------
                  smooth scroll init
-------------------------------------------------------*/
  (function($) {
    jQuery(document).ready(function($) {
    $(".scroll").click(function(event){ // When a link with the .scroll class is clicked
    event.preventDefault(); // Prevent the default action from occurring
    $('html,body').animate({scrollTop:$(this.hash).offset().top}, 1500, 'easeInSine'); // Animate the scroll to this link's href value
      });
    });
   })(jQuery);