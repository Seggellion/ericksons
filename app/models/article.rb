class Article < ApplicationRecord
    belongs_to :user
    has_rich_text :content
    belongs_to :category, optional: true

    validates :title, presence: true
  end
  