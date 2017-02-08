class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  scope :by_users, ->(user_ids) { includes(:user).where(user_id: user_ids) }
end
