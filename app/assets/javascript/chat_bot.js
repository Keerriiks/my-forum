$(document).ready(function() {
  $('#chat-bot-form').on('ajax:success', function(event, data, status) {
    var botResponse = data.bot_response;
    if (botResponse === "Извините, я не знаю ответа на ваш вопрос. Попробуйте воспользоваться поиском на форуме или создать тему.") {
      $('#bot-response').html('<p id="bot-response"> Извините, я не знаю ответа на ваш вопрос. Попробуйте воспользоваться поиском на форуме или <a href="/forum_threads/new">cоздать тему</a> </p>');
    } else {
      $('#bot-response').text(botResponse);
    }
  });
});
