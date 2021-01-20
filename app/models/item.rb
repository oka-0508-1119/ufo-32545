class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
  validates :get_price, presence: true
  validates :detail, presence: true
  validates :image, presence: true
end
