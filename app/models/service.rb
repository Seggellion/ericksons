class Service < ApplicationRecord
    belongs_to :category, optional: true
    has_rich_text :content
    has_one_attached :featured_image

    validates :title, presence: true
  end
  