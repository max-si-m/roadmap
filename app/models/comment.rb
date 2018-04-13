class Comment < ApplicationRecord
  include Contentable

  belongs_to :post, touch: true
end
