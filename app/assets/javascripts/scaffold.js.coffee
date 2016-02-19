ready = ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true,
    no_results_text: "Sem resultados para",
    placeholder_text_single: "Selecione uma opção",
    placeholder_text_multiple: "Selecione as opções",
    width: '100%'

  $('form').checkBo();

  $('[data-toggle="tooltip"]').tooltip()

$(document).ready(ready)
