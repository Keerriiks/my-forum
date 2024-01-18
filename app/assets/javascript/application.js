//= require jquery3
//= require jquery_ujs
//= require_tree .

$(document).ready(function() {
  setInterval(function() {
    $.ajax({
      url: 'check_email', // Замените на URL вашего серверного метода
      method: 'GET',
      success: function(response) {
        if (response.logout) {
          alert("Ваш аккаунт удалён.");
        }
      }
    });
  }, 3000); 
});