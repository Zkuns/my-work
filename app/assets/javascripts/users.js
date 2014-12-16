$(document).on("page:change", function(){
  $('.change-coo').on('click', function(){
    var $this = $(this);
    var myurl = $this.parent().data('url');
    $.ajax({
      url: myurl,
      type: 'get',
      complete: function(xhr, data){
        if(xhr.status ==200 ){
          $this.text((($this.text() == 'CPA') ? 'CPS' : 'CPA'))
        }else{
          alert('请刷新重试');
        }
      }
    });
  });
});
