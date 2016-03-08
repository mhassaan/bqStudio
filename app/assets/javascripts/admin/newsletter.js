$(document).on('ready page:load', function () {
   $('#newsletter_list').dataTable({"bSort": false});
   $('[data-toggle="tooltip"]').tooltip();
    $('.new_newsletter').datepicker({
       format: 'dd/mm/yyyy'
    });
    $('.ckeditor').ckeditor({
  // optional config
	});
});
