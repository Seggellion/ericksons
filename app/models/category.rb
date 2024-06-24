class Category < ApplicationRecord
    has_many :services
    has_many :testimonials
    has_many :pages
    has_many :articles
    has_many :posts
  
    validates :name, presence: true
  end
  