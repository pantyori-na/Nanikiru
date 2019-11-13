class PostImage < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :selections, allow_destroy: true
  attachment :image
  enum image_type:{player_4:0,player_3:1,others:2}, _prefix: true
end
