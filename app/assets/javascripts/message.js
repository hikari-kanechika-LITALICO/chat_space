$(function() {
  function buildHTML(data) {
    var message = data.message;
    var text = build_text(message);
    var image = build_image(message);

    var html = $(
      "<li class= 'chat-message'>" +
      "<div class = 'chat-message__header'>" +
      "<p class = 'chat-message__name'>" + message.name + "</p>" +
      "<p class = 'chat-message__time'>" + message.created_at + "</p>" +
      "<p class = 'chat-message__body'>" + text + image + "</p>" + "</div>" + "</li>");
    return html;
  };

  function build_text(message) {
    if (message.text==null) return "";
    return "<p>" + message.text + "</p>";
  }

  function build_image(message) {
    if (message.image==null) return "";
    return  '<img src="' + message.image + '">';
  }

  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.js-form__text-field');
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
