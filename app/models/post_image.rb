class PostImage < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
end
