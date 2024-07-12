class Block < ApplicationRecord
  belongs_to :section
  has_one_attached :image

  validates :block_type, presence: true
  validates :position, presence: true

  enum block_type: { image: 'image', rich_text: 'rich_text', single_line_text: 'single_line_text', json: 'json' }

  default_scope { order(:position) }

  def image?
    block_type == "image" && image.attached?
  end
end
