ready = ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'

  $('form').checkBo();

  $('[data-toggle="tooltip"]').tooltip()

$(document).ready(ready)
$(document).on('page:load', ready)
