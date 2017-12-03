$(function() {
  function buildHTML(data) {
    var message = data.message
    if (message.text) {
      var text = "<p>" + message.text + "</p>";
    } else {
      var text = "";
    }
    if (message.image) {
      var image = '<img src="' + message.image + '">';
    } else {
      var image = "";
    }
    var html = $(
      "<li class= 'chat-message'>" +
      "<div class = 'chat-message__header'>" +
      "<p class = 'chat-message__name'>" + message.name + "</p>" +
      "<p class = 'chat-message__time'>" + message.created_at + "</p>" +
      "<p class = 'chat-message__body'>" + text + image + "</p>" + "</div>" + "</li>");
    return html;
  };

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var message = textField.val();
    var fd = new FormData($(this).get(0));
    $.ajax({
      url: 'messages',
      type: 'POST',
      dataType: 'json',
      data: fd,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.chat-messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
