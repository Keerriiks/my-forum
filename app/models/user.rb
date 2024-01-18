class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_initialize :set_default_role, if: :new_record?


  validates :email, presence: true, uniqueness: { case_sensitive: false, unless: :deleted_email? }, allow_blank: true
  validates :nickname, presence: true, uniqueness: { case_sensitive: false, unless: :deleted_nick? }


  has_many :forum_threads, dependent: :nullify
  has_many :forum_posts, dependent: :nullify
  has_many :comments, dependent: :nullify


  def self.assign_from_row(row)
    user = User.where(email: row[:email]).first_or_initialize
    user.assign_attributes row.to_hash.slice(:first_name, :last_name)
    user
  end

  def self.to_csv
    attributes = %w{id email name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def name
    if deleted_at?
      "Deleted User"
    else
      "#{first_name} #{last_name}"
    end
  end

  def set_default_role
    self.role ||= 'user'
  end

  def deleted_nick?
    nickname == "пользователь удалён"
  end

  def deleted_email?
    email == "пользователь удалён"
  end
end