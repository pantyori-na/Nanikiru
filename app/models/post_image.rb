class PostImage < ApplicationRecord
  has_many :selections, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :user
  # follow機能はuserがuser(hasmany)を参照する
  has_many :users, through: :favorites
  attachment :image
  accepts_nested_attributes_for :selections, allow_destroy: true
  enum image_type:{player_4:0,player_3:1,others:2}, _prefix: true
  # userに対する回答済みのanswer_id
  def answered_id(user)
    self.selections.each do |selection|
      selection.answers.each do |answer|
        if answer.user_id == user.id
          return answer.id
        else
        end
      end
    end
     return false
  end
  def answered?(user)
    self.selections.each do |selection|
      if selection.answers.exists?
        if selection.answers.where(user_id: user.id).exists?
          return true
        end
      end
    end
    return false
  end
end
