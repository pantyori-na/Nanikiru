class Answer < ApplicationRecord
  belongs_to :selection
  belongs_to :user
  has_many :post_comments, dependent: :destroy


  # def answered?(post_image)
  #   post_image.selections.each do |selection|
  #     selection.answers.each do |answer|
  #       if answer.user_id == current_user.id
  #         true
  #       else
  #         false
  #       end
  #     end
  #   end
  # end
end
