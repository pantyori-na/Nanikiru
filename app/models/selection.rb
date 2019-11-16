class Selection < ApplicationRecord
  belongs_to :post_image
  has_many :answers
  enum name:{m_1:0,m_2:1,m_3:2,m_4:3,m_5:4,m_6:5,m_7:6,m_8:7,m_9:8,p_1:9,p_2:10,p_3:11,p_4:12,p_5:13,p_6:14,p_7:15,p_8:16,p_9:17,select:18,s_1:19,s_2:20,s_3:21,s_4:22,s_5:23,s_6:24,s_7:25,s_8:26,s_9:27,ton:28,nan:29,sya:30,pe:31,haku:32,hatu:33,tyun:34,naku:35,nakanai:36,reach:37,no_reach:38,hora:39,no_hora:40,ryuukyoku:41,no_ryuukyoku:42,others:43}, _prefix: true
  def answer_count
    Answer.where(selection_id:id).count
  end
end
