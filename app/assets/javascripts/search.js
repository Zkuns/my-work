$(function(){

  search = function(){
    var key = $('#keyword').val()
    $.get('/search',{keyword: key})
  }

  prepare = function(){
    $.get('/prepare')
  }

  $('#keyword').bind('keyup', search)
  $('#keyword').bind('focus', prepare)
})