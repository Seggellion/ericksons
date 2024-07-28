class User < ApplicationRecord
    has_many :pages
    has_many :posts
    has_many :media
    has_many :comments
    has_many :contact_messages, foreign_key: :email, primary_key: :email
  
    validates :uid, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
  end
  