// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap-timepicker
//= require jquery-ui
//= require jquery_nested_form
//= require jquery.dataTables.min.js
//= require custome.js
//= require_tree .










$(document).ready(function(){
  $('.start_date_picker').datepicker({
    format: 'yyyy-mm-dd',
    minDate: 'dateToday'

  })
})



$(document).ready(function(){
	$("#print").click(function(){
	   window.print();;
	});
})

$(document).ready(function(){
  $('.date_picker').datepicker({
    format: 'yyyy-mm-dd',

  })
})




