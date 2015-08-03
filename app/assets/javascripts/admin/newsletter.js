$(document).on('ready page:load', function () {
   $('#newsletter_list').dataTable();
   $('[data-toggle="tooltip"]').tooltip();
    $('.new_newsletter').datepicker({ 
       format: 'dd/mm/yyyy'
    });
});
