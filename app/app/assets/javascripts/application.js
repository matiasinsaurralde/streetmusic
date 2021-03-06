// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready( function() {
  if( !navigator.geolocation ) {
    // tell the user that we can't access geo info, maybe unsupported browser!
  };
});

function lookupPerformers() {
  navigator.geolocation.getCurrentPosition( function(p) {
    $.post( "/performers/lookup",
            { 'position': p.coords.latitude+','+p.coords.longitude }, function( data ) {
              for ( i in data ) {
                e = data[i];
                splits = e.position.split(',');
                e_marker = new google.maps.Marker({
                  position: new google.maps.LatLng( parseFloat(splits[0]), parseFloat(splits[1]) ),
                  map: window.map,
                  title: e.name,
                  icon: '/music.png'
                });
              };
            } );
    console.log(p.coords.latitude, p.coords.longitude)
  },
  function(e) {
  });
};
