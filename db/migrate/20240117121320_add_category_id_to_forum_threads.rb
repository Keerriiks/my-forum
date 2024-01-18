class AddCategoryIdToForumThreads < ActiveRecord::Migration[7.1]
  def change
    add_reference :forum_threads, :forum_category, foreign_key: true
  end
end
