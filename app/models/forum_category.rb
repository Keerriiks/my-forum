class ForumCategory < ApplicationRecord
    has_many :forum_threads

    def self.ransackable_attributes(auth_object = nil)
        ["id", "name"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["forum_threads"]
    end
end
