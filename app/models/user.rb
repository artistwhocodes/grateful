class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  has_many :posts, dependent: :destroy
  has_many :tags
  has_many :tags, through: :posts


  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "only allows letters" }
  validates :username, presence: true , length: { in: 6..14 } ,uniqueness: true,  format: { with: /\A[a-zA-Z0-9]+\z/,
  message: "Only allows letters and no spaces." }
  validates :password,  confirmation: true, length: { in: 6..20 } , unless: ->(u){ u.password.blank? }  #16.59



  #accepts_nested_attributes_for :tags
end
