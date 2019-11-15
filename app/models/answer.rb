class Answer < ApplicationRecord
  belongs_to :selection
  belongs_to :user
  has_many :post_comments, dependent: :destroy
end
