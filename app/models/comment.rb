class Comment < ApplicationRecord
  belongs_to :forum_thread
  belongs_to :user

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "forum_thread_id", "id", "id_value", "updated_at", "user_id", "username"]
  end
end
