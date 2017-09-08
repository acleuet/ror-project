$(function() {
  var modal_holder_selector, modal_selector;

  modal_holder_selector = '#modal-holder';

  modal_selector = '.modal';

  $(document).on('click', 'a[data-modal]', function() {
    var location;
    location = $(this).attr('href');
    $.get(location, function(data) {
      return $(modal_holder_selector).html(data).find(modal_selector).modal();
    });
    return false;
  });

  $(document).on('ajax:success', 'form[data-modal]', function(event, data, status, xhr) {
    var url;
    url = xhr.getResponseHeader('Location');
    if (url) {
      $('<div class="reloading-page"><i class="fa fa-cog fa-spin fa-3x fa-fw"></i></div>').appendTo(document.body);
      $('.modal-backdrop').remove();
      $(modal_holder_selector).html(data).find(modal_selector).modal();
      window.location.reload()
    } else {
      $('.modal-backdrop').remove();
      $(modal_holder_selector).html(data).find(modal_selector).modal();
    }
    return false;
  });

});