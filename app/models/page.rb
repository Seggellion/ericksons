class Page < ApplicationRecord
    belongs_to :user
    has_rich_text :content

    validates :title, presence: true


    extend FriendlyId
    friendly_id :title, use: :slugged

    has_many :comments, as: :commentable
    belongs_to :category, optional: true

  end
  