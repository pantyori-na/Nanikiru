class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports, dependent: :destroy
  has_many :game_records, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy
  # お気に入り機能
  has_many :fav_post_images, through: :favorites, source: :post_image
  # follow機能
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  attachment :profile_image
  enum dan_4p_proper:{please_select_your_dan:0,until_dan:1,dan_1:2,dan_2:3, dan_3:4, dan_4:5, dan_5:6, dan_6:7, dan_7:8, dan_8:9, dan_9:10, dan_10:11, dan_11:12}, _prefix: true
  enum dan_3p_proper:{please_select_your_dan:0,until_dan:1,dan_1:2,dan_2:3, dan_3:4, dan_4:5, dan_5:6, dan_6:7, dan_7:8, dan_8:9, dan_9:10, dan_10:11, dan_11:12}, _prefix: true
  # お気に入り機能_method
  def like(post_image)
    favorites.find_or_create_by(post_image_id: post_image.id)
  end
  def unlike(post_image)
   favorite = favorites.find_by(post_image_id: post_image.id)
   favorite.destroy if favorite
  end
  def favorited_by?(post_image)
    favorites.where(post_image_id: post_image.id).exists?
  end

  # follow機能_method
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  def following?(other_user)
    self.followings.include?(other_user)
  end

  # user has Answers の中のselection_idの重複をなくす
  def same_answer_destroy
    answers = self.answers
    if answers.group(:selection_id).having('count(*) >= 2').present?
			hash = answers.group(:selection_id).having('count(*) >= 2').maximum(:created_at)
			answer_ids = answers.where(selection_id: hash.keys, created_at: hash.values).pluck(:id)
			answers.where(selection_id: hash.keys).where.not(id: answer_ids).destroy_all
    end
  end
end
