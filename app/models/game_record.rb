class GameRecord < ApplicationRecord
  belongs_to :user
  enum game_name:{tenhou:0,mj:1,tengokuhai:2,jantama:3, kakutoukurabu:4, marujan:5, mahjong4:6, janrevo:7, freemahjong:8, setmahjong:9, pro:10, others:11}, _prefix: true
  enum ability:{beginner:0,until_dan:1,dan_1:2,dan_2:3, dan_3:4, dan_4:5, dan_5:6, dan_6:7, dan_7:8, dan_8:9, dan_9:10, dan_10:11, dan_11:12, ou:13, ryu:14, kami:15, jyan:16, saikyoui:17, so_strong:18, strong:19, very_strong:20, weak:21}, _prefix: true
  enum game_type:{player_4:0,player_3:1,others:2}, _prefix: true
end
