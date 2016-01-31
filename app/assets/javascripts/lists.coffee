# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_element', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.form-group').hide()
    event.preventDefault()

  count = 0
  $('form').on 'click', '.add_element', (event) ->
    namespace = $(this).data('namespace')
    num = namespace + count
    regexp = new RegExp($(this).data('id'), 'g')
    $('.element_links').before($(this).data('fields').replace(regexp, num))
    $('form .order_number').last().val(num)
    count += 1
    event.preventDefault()

  list_count = 0
  $('form').on 'click', '.add_list_item', (event) ->
    namespace = $(this).data('namespace') + list_count
    list_count = namespace
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).closest('.add_list_item').before($(this).data('fields').replace(regexp, list_count))
    # $('form .order_number').last().val(list_count)
    list_count += 1
    event.preventDefault()
