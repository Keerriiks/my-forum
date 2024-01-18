$(document).ready(function() {
  $(document).on('click', '#moderator-link', function() {
    var role = "moder";
    var userId = $(this).closest("tr").data("user-id");
    $.ajax({
      url: 'users_table/change_role',
      method: 'POST',
      data: {
        new_role: role,
        id: userId
      },
      success: function(response) {
        location.reload()
      },
      error: function(xhr, status, error) {

      }
    });
  });

  $(document).on('click', '#user-link', function() {
    var role = "user";
    var userId = $(this).closest("tr").data("user-id");
    $.ajax({
      url: 'users_table/change_role',
      method: 'POST',
      data: {
        new_role: role,
        id: userId
      },
      success: function(response) {
        location.reload()
      },
      error: function(xhr, status, error) {

      }
    });
  });

  $(document).on('click', '.remove-user', function() {
    location.reload();
  });

});