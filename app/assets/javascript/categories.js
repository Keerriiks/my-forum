// $(document).ready(function() {
//   $(".selected-cats").change(function() {
//     var selectedCategoryId = $(this).val();
//     var selectedText = "";
    
//     $("#query_category_id_eq").find("option").each(function(){
//       var optionValue = $(this).val(); 
//       if (optionValue !== selectedCategoryId) {
//         $(this).remove(); // Удаляем элемент, если его значение не совпадает с выбранным
//       }
//     });
    
//     $.ajax({
//       url: "/forum_threads",
//       type: "GET",
//       data: { "query[forum_category_id]": selectedCategoryId, "commit": "Найти"}, // Передаем параметры запроса в объекте
//       success: function(data) {

//       },
//       error: function() {
//         // Обработка ошибок
//       }
//     });
//   });
// });

$(document).ready(function() {
  $('#forum_thread_form').on('ajax:success', function(event) {
    $('#forum_threads').html(event.detail[2].responseText);
  });
});