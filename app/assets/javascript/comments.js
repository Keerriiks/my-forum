$(document).ready(function() {
  $(document).on('click', '.edit-comment', function() {
    var commentId = $(this).data('comment-id');
    var commentBody = $('#comment_' + commentId);
    var editableComment = $('<textarea id="comment_'+ commentId +'">' + commentBody.text() + '</textarea>');
    commentBody.replaceWith(editableComment);
    $(this).hide();
    var saveButton = $('<button class="save-comment" data-comment-id="'+ commentId +'"> <span class="glyphicon glyphicon-ok"></span></button>');
    var deleteButton = $('<button class="delete-comment" data-comment-id="'+ commentId +'"><span class="glyphicon glyphicon-remove"></span></button>');
    $(this).after(saveButton);
    $(this).after(deleteButton);
  });

  $(document).on('click', '.save-comment', function() {
    var commentId = $(this).data('comment-id');
    var commentBody = $('#comment_' + commentId);
    var editedText = commentBody.val();

    if (editedText.trim() === '') {
      alert('Сообщение не может быть пустым');
      return;
    }

    $.ajax({
      url: 'forum_post/comments/' + commentId,
      method: 'PUT',
      data: { comment: { body: editedText } },
      success: function(response) {
        var updatedComment = $('<span id="comment_' + commentId + '">' + editedText + '</span>');
        commentBody.replaceWith(updatedComment);
        $('.save-comment').remove(); 
        $('.delete-comment').remove();
        $('.edit-comment').show();
      },
      error: function(error) {
        console.log('Error:', error);
      }
    });
  });

  $(document).on('click', '.delete-comment', function() {
    var commentId = $(this).data('comment-id');
    $.ajax({
      url: 'forum_post/comments/' + commentId,
      method: 'DELETE',
      success: function(response) {
        $('#cmnt_' + commentId).remove(); 
        $('.save-comment').remove(); 
        $('.delete-comment').remove(); 
        $('.edit-comment').show();
      },
      error: function(error) {
        console.log('Error:', error);
      }
    });
  });


  $(document).ready(function() {
    $('.btn-primary').click(function(event) {
      var commentContent = $('#comment_body').val();
      if (commentContent === '' || commentContent.replace(/\s/g, '') === '') {
        event.preventDefault(); 
        alert('Комментарий не может быть пустым!');
      }
    });
  });


});
