$(function() {
  function buildHTML(message) {
    var html = $("<li class= 'chat-message'>" +  "<div class = 'chat-message__header'>" + "<p class = 'chat-message__name'>" + chat_body.user.name + "</p>" + "<p class = 'chat-message__time'>" + chat_body.created_at.to_s(:published_on) + "</p>" + "<p class = 'chat-message__body'>" + chat_body.try(:text) + "</p>" + "</div>" + "</li>") ;
    return html;
  }
  $('.js-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
    $.ajax({
      type: 'POST',
      url: '/messages.json',
      data: {
        message: {
          content: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.messages').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
