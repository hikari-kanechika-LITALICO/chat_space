$(function() {
  function buildAddUserHTML(user) {
    var html = '<div class="chat-group-user clearfix chat-group-user-add">' +
               '<p class="chat-group-user__name">' + user.name + '</p>' +
               '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">追加' +
               '</a>' +
               '</div>';
    return html;
  }
  function AddUserHTML(id, name) {
    var html = '<div class="chat-group-user clearfix" id="chat-group-user-' + id + '">' +
               '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
               '<p class="chat-group-user__name">' + name + '</p>' +
               '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' + id + '">削除' +
               '</a>' +
               '</div>';
    return html;
  }
  $('#user-search-field').on('keyup', function() {
    var input = $.trim($('#user-search-field').val());
      $.ajax({
        type: 'GET',
        url: '/users/search',
        data: {
          q: input
        },
        dataType: 'json'
      })
    .done(function(data) {
      var insertHtml = ""
       $.each(data, function(i, user) {
         insertHtml += buildAddUserHTML(user);
       });
       $('.chat-group-user__list').html(insertHtml);
    })
    .fail(function() {
      alert('エラーです');
    });
  });
  $(document).on('click', '.chat-group-user__btn--add', function(){
    $(this).parent().remove();
    var id = $(this).data('user-id');
    var name = $(this).data('user-name');
    $('#chat-group-users').append(AddUserHTML(id, name));
  });
  $(document).on('click', '.chat-group-user__btn--remove', function(){
    $(this).parent().remove();
  });
});
