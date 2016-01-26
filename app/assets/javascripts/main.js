$(document).ready(function() {
  $("a.add_fields").data("association-insertion-method", 'before').data("association-insertion-node", 'this');

  $('body').on('cocoon:after-insert', function(e, insertedItem) {
    $("select.chosen-select").chosen();
  });
});
