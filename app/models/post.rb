class Post < ApplicationRecord
  include Contentable

  has_many :comments

  scope :by_users, ->(user_ids) { includes(:user).where(user_id: user_ids) }
end
