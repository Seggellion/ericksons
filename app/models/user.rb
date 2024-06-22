class User < ApplicationRecord
    has_many :pages
    has_many :posts
    has_many :media
    has_many :comments
  
    validates :uid, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  end
  