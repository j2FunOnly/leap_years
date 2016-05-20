$(document).ready( function () {
  console.log('document ready');
  $('.datepicker').datetimepicker({
    format: 'YYYY',
    viewMode: 'years',
  });
});

var loadLeapYears = function () {
  $.ajax({
    url: '/',
    type: 'POST',
    data: $('#leap_year_form').serialize(),
    dataType: 'html',
    success: function (data) {
      $('#submit_btn').removeAttr('disabled');
      console.log('ajax request success');
      $('.well').html(data);
    }
  });
}

$('#leap_year_form').submit(function(ev){
  ev.preventDefault();
  console.log('form submitted');
  $('#submit_btn').attr('disabled', 'disabled');
  $('.well').html('<h2><span class="glyphicon glyphicon-time" aria-hidden="true"></span></h2>');
  loadLeapYears();
});
