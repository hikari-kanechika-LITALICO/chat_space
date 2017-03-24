$(function() {
  function buildHTML(data) {
    var message = data.message
    var html = $("<li class= 'chat-message'>" +  "<div class = 'chat-message__header'>" + "<p class = 'chat-message__name'>" + message.name + "</p>" + "<p class = 'chat-message__time'>" + message.created_at + "</p>" + "<p class = 'chat-message__body'>" + message.text + "</p>" + "</div>" + "</li>");
    return html;
  };

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    var message = textField.val();
    $.ajax({
      url: 'messages',
      type: 'POST',
      dataType: 'json',
      data: {
        message: {
          text: message
        }
      },
      dataType: 'json'
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
