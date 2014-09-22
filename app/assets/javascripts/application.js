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
//= require twitter/bootstrap
//= require turbolinks
//= require selectize
//= require jquery_nested_form
//= require_tree .
//

$(document).ready(function(){
  $(document.body).on("click", '#link-to-medicine', function(){
    var selected_id = $(event.target).parent('.prescription').find('select option:selected').val();
    var left  = ($(window).width()/2) - 200;
    var t = ($(window).height()/2);
    var url = window.location.origin + "\/medicines\/" + selected_id + "\/preview";
    var popup = window.open (url, "popup", "width=400, height=300, top=" + t + ", left=" + left);
    return false;
  }); 
});

$(document).ready(function(){
  $('#family-history, #previous-diseases').parent().find('option').bind("contextmenu", function(){
    var left  = ($(window).width()/2) - 200;
    var t = ($(window).height()/2);
    var url = window.location.origin + "\/diseases\/" + $(this).val() + "\/preview";
    var popup = window.open (url, "popup", "width=400, height=300, top=" + t + ", left=" + left);
    return false;
  }); 
});
