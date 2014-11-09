 $(function(){
  // var removeActivities=function() {
  //   $(this).text('近期活动↓')
  //   $('#activities').children().remove()
  //   $(this).unbind('click', removeActivities)
  //   $(this).bind('click', addActivities)
  // }

  // var addActivities=function() {
  //   $(this).text('近期活动↑')
  //   var data_url = $(this).data('url')
  //   $.get(data_url, null, function(data){
  //     data.forEach(function(activity){
  //       var compile = Handlebars.compile("<li><a href='javascript:void(0)' data-id='{{id}}'>{{title}}</a></li>")
  //       $('#activities').append(compile(activity))
  //       alert(activity.title)
  //     })
  //   }, 'json')
  //   $(this).unbind('click', addActivities)
  //   $(this).bind('click', removeActivities)
  // }
  // $('#get_data a').bind('click', addActivities)

  var addActivities=function() {
    $('#activities').children().remove()
    var data_url = $(this).data('url')
    $.get(data_url, null, function(data){
      data.forEach(function(activity){
        var compile = Handlebars.compile("<tr><td><a href='/?id={{id}}'>{{title}}</a></td>" +
                                                                       "<td><a href='/import?id={{id}}' data-remote='true'>" +
                                                                       "更新数据</a></td></tr>")
        $('#activities').append(compile(activity))
      })
    }, 'json')
    $.get('/save')
  }
  $('#get_data a').bind('click', addActivities)

})