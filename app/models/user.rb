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
  attachment :profile_image
  enum dan_4p_proper:{please_select_your_dan:0,until_dan:1,dan_1:2,dan_2:3, dan_3:4, dan_4:5, dan_5:6, dan_6:7, dan_7:8, dan_8:9, dan_9:10, dan_10:11, dan_11:12}, _prefix: true
  enum dan_3p_proper:{please_select_your_dan:0,until_dan:1,dan_1:2,dan_2:3, dan_3:4, dan_4:5, dan_5:6, dan_6:7, dan_7:8, dan_8:9, dan_9:10, dan_10:11, dan_11:12}, _prefix: true
end
