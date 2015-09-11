$ ->
  agent = navigator.userAgent
  if(agent.search(/iPhone/) == -1 && agent.search(/iPad/) == -1)
    $('.datepicker').datetimepicker({
      locale: 'ja'
      dayViewHeaderFormat: 'YYYY / MMMM'
      format: 'YYYY-MM-DD'
      useCurrent: false
      showTodayButton: true
      showClear: true
      showClose: true
     })
