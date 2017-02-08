class Post < ApplicationRecord
  include Contentable

  has_many :comments
end
