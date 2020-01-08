class Answer < ApplicationRecord
  belongs_to :selection
  belongs_to :user
  has_many :post_comments, dependent: :destroy

  # post_imageに対するcommentsを取得
  def post_image_comments(post_image)
    post_image_comments = []
    post_image.selections.each do |selection|
      if selection.answers.present?
        selection.answers.each do |answer|
          PostComment.where(answer_id: answer.id).each do |comment|
            post_image_comments.push(comment.id)
          end
        end
      end
    end
    return PostComment.find(post_image_comments.sort.reverse)
  end
end
