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
//= require bootstrap-sprockets
//= require select2
//= require_tree .

$(document).on('turbolinks:load', function(){
  $(".alert" ).fadeOut(5000);
  initSelect2();
  // var clipboard = new Clipboard('#clip');
  // clipboard.on('success', function(e) {
  //   e.clearSelection();
  //   $('#clip').attr('title', 'Copied!').tooltip('show').removeAttr('title');
  //   setTimeout(function () {
  //       $('#clip').tooltip('destroy');
  //   }, 2000)
  // });
  $(".clickable[data-link]").click(function() {
    window.location = $(this).data("link");
  });
});

$(window).resize(function(){
 initSelect2();
});

function initSelect2(){
  $('.select2').select2({
    placeholder: "Select an option",
    theme: "bootstrap"
  });
}
