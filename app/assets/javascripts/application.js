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

  var name = $('.item .changeable').parents('input[name]').attr('value');
  var total_price = $('.item .changeable').parents('.item').find('.total span');
  var unit_price = $('.item .changeable').parents('.item').find('#unit_price').attr('value');
  var quantity =  $('.item .changeable').parents('.item').find('#count option:selected').attr('value');
  var total = unit_price * quantity;
  var discount_value = $('.item .changeable').parents('.item').find('#discount option:selected').attr('value');
  var discount = discount_value / 100;
  var temp = 1 - discount;
  var discounted_total = (total * temp).toFixed(2);

  $('.item .changeable').live('change', function () {
    if($(this).parents('.item').find('input[name]').attr('value') == '') {
      $(this).parents('.item').find('input[name]').addClass('error');
    }
    var total_price = $(this).parents('.item').find('.total span');
    var unit_price = $(this).parents('.item').find('#unit_price').attr('value');
    var quantity = $(this).parents('.item').find('#count option:selected').attr('value');
    var total = (unit_price * quantity).toFixed(2);
    total_price.html(total);
  });

  $('.item .add_item').live('click', function(e) {
    e.preventDefault();
    $(this).parents('changeable').attr('disabled');
    var name = $(this).parents('.item').find('input#name').attr('value');
    var total_price = $(this).parents('.item').find('.total span');
    var unit_price = $(this).parents('.item').find('#unit_price').attr('value');
    var quantity =  $(this).parents('.item').find('#count option:selected').attr('value');
    var total = (unit_price * quantity).toFixed(2);
    var invoice_id = $('#invoice_id').html() + 1;

    if( total != 0 && name) {
      $(this).addClass('hidden');
      $.post('/add_item', {
                            invoice_id: invoice_id,
                            name:  name,
                            quantity: quantity,
                            unit_price: unit_price,
      })
       .success(
        function() {
          $('.alert-box').addClass('success');
          $('.alert-box .notice').html('Added with success');
      });
    } else {
      $('.alert-box').addClass('error');
      $('.alert-box .notice').html('please fill up all requested values');
    }
  });

  $('.item .remove_item').live('click', function(e) {
    e.preventDefault();
    id = $(this).attr('id').replace('item_','');
    alert(id);
    $.post('/remove_item/' + id);
    $(this).parents('.item').remove();
  })

  $('.item .edit_item').live('click', function(e) {
    e.preventDefault();
    $(this).find('input').removeAttr('disabled');
    $(this).find('select').removeAttr('disabled');
  })

  $('#invoice_discount_id').live('change', function () {
    var discount = $('#invoice_discount_id option:selected').html();
    var subtotal = $('#subtotal span').html();
    var total = (subtotal * (1 - discount/100)).toFixed(2);
    $('#total').html(total);
  });

  $('#invoice_tax_id').live('change', function () {
    var tax = $('#invoice_tax_id option:selected').html();
    var subtotal = $('#total').html();
    var total = (subtotal * (1 - tax/100)).toFixed(2);
    $('#grand_total').html(total);

  });
});

$(window).load(function() {
    $("#featured").orbit({ fluid: '16x9' });
});
