// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require jquery-ui
//= require autocomplete-rails
//= require ckeditor/init
//= require tag-it.min
//= require_tree .


$(function () {
  var input_value = $('#media_value').attr('value');

  $('.media_item').each(function () {
    if($(this).find('img').attr('id') == input_value) {
      $(this).addClass('selected');
    }
  });
  $('.media_item').click(function(e) {
    $('.media_item').removeClass('selected');
    $('#media_value').attr('value', $(this).find('img').attr('id'));
    $(this).addClass('selected');
    e.preventDefault();
  });
  var sampleTags = '';
  $('#tags ul').tagit({
    availableTags: sampleTags,
    allowSpaces: true,
    itemName: 'item',
    fieldName: 'tags',
    onTagExists: function(evt, ui) {
        addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
    }
  });

  $('.item').find('.unit_price').change(function () {
    if($('.item_1 input[name]').attr('value') == '') {
      $('.item_1 input[name]').addClass('error');
    }
    var total_price = $('.item .total span');
    var unit_price = $('.item #unit_price').attr('value');
    var quantity = $('.item  #count option:selected').attr('value');
    var total = unit_price * quantity;
    var discount_value = $('.item #discount option:selected').attr('value');
    var discount = discount_value / 100;
    var temp = 1 - Math.round(discount);
    var discounted_total = total * temp;
    total_price.html(discounted_total);
  });

  $('.add_item a').live('click', function(e) {
    var total_price = $('.item .total span');
    var unit_price = $('.item #unit_price').attr('value');
    var quantity = $('.item  #count option:selected').attr('value');
    var total = unit_price * quantity;
    var discount_value = $('.item #discount option:selected').attr('value');
    var discount = discount_value / 100;
    var temp = 1 - Math.round(discount);
    var discounted_total = total * temp;
    $.post('/add_item', {
                          invoice_id: $('#invoice_id').attr('value'),
                          name: $('.item input[name]').attr('value'),
                          quantity: quantity,
                          unit_price: unit_price,
                          discount: discount_value,
                          total: discounted_total
                       });
    $('tr.item.hidden').clone().insertAfter('.item:last').removeClass('hidden');
    e.preventDefault();
  });

});
