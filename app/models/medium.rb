class Medium < ApplicationRecord
    belongs_to :user
  
    validates :file, presence: true
  end
  