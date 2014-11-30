$(document).on("page:change", function(){
  $('#select-month').datepicker({
    minViewMode: 1,
    language: "zh-CN",
    autoclose: true
  })
  $('#range').datepicker({
    language: "zh-CN",
    autoclose: true
  })
  $('#select').datepicker({
    language: "zh-CN",
    autoclose: true
  })
})