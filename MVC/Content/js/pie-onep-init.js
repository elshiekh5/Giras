jQuery(document).ready(function($) {
(function(){
  "use strict";

$('.block_skill').appear(function() {
         $(".theskill").each(function() 
          {
              var skillId  = $(this).attr('id');
              var color    = $(this).attr("data-color");
              if(skillId !='')
              {
                  $('#' + skillId).easyPieChart({
                      barColor: color ,
                      trackColor: 'rgba(0,0,0,0.1)',
                      scaleColor: false,
                      lineCap: 'butt',
                      lineWidth: 8,
                      size: 180,
                      animate: 4000,
                  });
              }

          });

}, { offset: 100 });

})();

});
