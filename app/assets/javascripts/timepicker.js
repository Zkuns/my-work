$(document).on("page:change", function(){
  $('#select-month').datepicker({
    minViewMode: 1,
    language: "zh-CN",
    autoclose: true,
    format: 'yyyy-mm'
  })
  $('#range').datepicker({
    language: "zh-CN",
    autoclose: true,
    format: 'yyyy-mm-dd'
  })
  $('#select').datepicker({
    language: "zh-CN",
    autoclose: true,
    format: 'yyyy-mm-dd'
  })
})