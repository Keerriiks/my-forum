class NotificationMailer < ActionMailer::Base
    default from: "notifications@forumogu.com"
  
    def forum_post_notification(user, forum_post)
      @user = user
      @forum_post = forum_post
  
      mail(
        to: "#{user.email}",
        subject: "[Форум ОГУ] Новый пост в #{forum_post.forum_thread.subject}"
      )
    end
  end