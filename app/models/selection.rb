class Selection < ApplicationRecord
  belongs_to :post_image
  has_many :answers
  enum name:{m_1:0,m_2:1,m_3:2,m_4:3,m_5:4,m_6:5,m_7:6,m_8:7,m_9:8,p_1:9,p_2:10,p_3:11}, _prefix: true
end
