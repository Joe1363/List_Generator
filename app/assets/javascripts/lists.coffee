# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_element', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.form-group').hide()
    event.preventDefault()

  time = 1
  $('form').on 'click', '.add_element', (event) ->
    # time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $('form .order_number').last().val(time)
    time += 1
    event.preventDefault()
