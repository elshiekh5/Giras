$(function(){
      
  $("#map").gMap({
controls: {
            panControl: true,
            zoomControl: true,
            mapTypeControl: true,
            scaleControl: false,
            streetViewControl: true,
            overviewMapControl: false
        },
    scrollwheel: false,
    markers: [
        {
            latitude: 38.898089,
            longitude: -77.044748,
            icon: {
                image: "images/map-pin.png",
                iconsize: [154, 75],
                iconanchor: [154,75]
            }            
        }
    ],    
    zoom: 18
  });
});