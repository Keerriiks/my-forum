class ForumThread < ActiveRecord::Base
    acts_as_paranoid

    belongs_to :user    
    belongs_to :forum_category
    has_many :forum_posts
    has_many :comments
    has_many :users, through: :forum_posts


    accepts_nested_attributes_for :forum_posts
  
    validates :subject, presence: true
    validates_associated :forum_posts

    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "deleted_at", "id", "id_value", "subject", "updated_at", "user_id", "forum_category_id"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["comments", "forum_posts", "user", "users", "forum_category"]
    end
end