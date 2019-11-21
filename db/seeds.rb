# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
User.create!(
   email: Faker::Internet.email,
   password: rand(111111..999999),
   name: Faker::JapaneseMedia::SwordArtOnline.real_name,
   dan_4p_proper: rand(10),
   dan_3p_proper: rand(10),
   introduction: Faker::Movies::HarryPotter.spell,
   profile_image_id: '71baafbaffe8426e7b3fd1e748d191c540c442a1ee33946c7722ab13d63a'
)
end

40.times do |x|
  GameRecord.create!(
    user_id: rand(1..20),
    handle_name: 'ゲーム内でのname',
    game_type: rand(2),
    ability: rand(10),
    game_name: rand(5)
  )
end

20.times do
  PostImage.create!(
    user_id: rand(1..20),
    image_type: 1,
    image_id: '093557157459e42283ab98b3627a5e2e37669db36568c38ee53c9076517a',
    comment: Faker::JapaneseMedia::OnePiece.akuma_no_mi,
  )
end

20.times do
  PostImage.create!(
    user_id: rand(1..20),
    image_type: 2,
    image_id: 'cfd63bf073e2522375019d19642b732b64f23fc8fd8d653b6f0258dd81f6',
    comment: Faker::JapaneseMedia::OnePiece.akuma_no_mi,
  )
end

20.times do
  PostImage.create!(
    user_id: rand(1..20),
    image_type: 0,
    image_id: '22a8ef30f3f8337662652e4c7e55b2e92227343fa089f4570b8f82f41b24',
    comment: Faker::JapaneseMedia::OnePiece.akuma_no_mi,
  )
end

50.times do |x|
  4.times do |y|
    Selection.create!(
      post_image_id: x+1,
      name: rand(30),
    )
  end
end

50.times do |x|
  Answer.create!(
    user_id: rand(1..20),
    selection_id: rand(1..200)
  )
end
