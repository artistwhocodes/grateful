class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :tags
  has_many :tags, through: :posts

  #accepts_nested_attributes_for :tags
end

 
