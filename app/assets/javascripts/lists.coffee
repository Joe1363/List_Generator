# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_element', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.form-group').hide()
    event.preventDefault()

  count = 1
  $('form').on 'click', '.add_element', (event) ->
    regexp = new RegExp($(this).data('id'), 'g')
    $('.element_links').before($(this).data('fields').replace(regexp, count))
    $('form .order_number').last().val(count)
    count += 1
    event.preventDefault()
