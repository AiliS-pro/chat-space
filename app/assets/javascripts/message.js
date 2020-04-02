$(function(){ 
     function buildHTML(tweet){
      if (tweet.image) {
        var html =
         `<div class="main__message-list__message-unit">
            <div class="main__message-list__message-unit__messanger-info">
              <div class="main__message-list__message-unit__messanger-info--messanger-name">
                ${tweet.user_name}
              </div>
              <div class="main__message-list__message-unit__messanger-info--sent-time">
                ${tweet.created_at.strftime("%Y年%m月%d日 %H時%M分")}
              </div>
            </div>
            <div class="main__message-list__message-unit--sent-message">
              <p class="lower-message__content">
                ${tweet.tweet}
              </p>
            </div>
           <img src=${tweet.image} >
          </div>`
        return html;
      } else {
        var html =
         `<div class="main__message-list__message-unit">
            <div class="main__message-list__message-unit__messanger-info">
              <div class="main__message-list__message-unit__messanger-info--messanger-name">
                ${tweet.user_name}
              </div>
              <div class="main__message-list__message-unit__messanger-info--sent-time">
                ${tweet.created_at}
              </div>
            </div>
            <div class="main__message-list__message-unit--sent-message">
              <p class="lower-message__content">
                ${tweet.tweet}
              </p>
            </div>
          </div>`
        return html;
      };
    }
$('#new_tweet').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
     .done(function(data){
       var html = buildHTML(data);
       $('.tweets').append(html);
       $('.main__message-list').animate({ scrollTop: $('.main__message-list')[0].scrollHeight});
       $('form')[0].reset();
       $('.main__footer__message-form__send-btn').prop('disabled', false);
     })
     .fail(function() {
       alert("メッセージ送信に失敗しました");
     });
})
});