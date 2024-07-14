class Service < ApplicationRecord
    belongs_to :category, optional: true
    has_rich_text :content
    has_many_attached :images

    validates :title, presence: true
    extend FriendlyId
    friendly_id :title, use: :slugged
  end
  