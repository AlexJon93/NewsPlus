# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener("turbolinks:load", ->
    $('.topic-btn').click ->
        clicked_val = $(this).toggleClass('active')
    $('.filterbtn').click ->
        $(this).addClass('selected').siblings().removeClass('selected')
    $('.replybtn').click ->
        reply = $("#comment-content-#{$(this).val()}").html()
        user = $("#comment-user-#{$(this).val()}").html()
        $('.reply-hdn').val($(this).val())
        $('.replying').html("Replying to '#{reply}' - #{user}")
        $('.replying').show()
)