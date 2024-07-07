class MenuItem < ApplicationRecord
  belongs_to :menu
  belongs_to :parent, class_name: 'MenuItem', optional: true
  has_many :children, class_name: 'MenuItem', foreign_key: 'parent_id', dependent: :destroy
  validates :url, presence: true
  acts_as_list scope: :menu
  scope :roots, -> { where(parent_id: nil) }

end
