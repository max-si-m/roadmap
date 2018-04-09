module Contentable
  extend ActiveSupport::Concern

  included do
    validates :title, :body, presence: true

    belongs_to :user
  end

  class_methods do
    # #last it's #last method from AR Model
    def latest_title
      last.full_title
    end
  end

  # "just a method" will be instance method (available only for instance)
  def full_title
    "#{title}: #{created_at}"
  end
end
