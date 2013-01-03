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

  $('#tags ul').tagit({
                availableTags: sampleTags,
                allowSpaces: true,
                itemName: 'item',
                fieldName: 'tags',
                onTagExists: function(evt, ui) {
                    addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
                }

            });


});
