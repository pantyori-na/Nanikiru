json.extract! post_image, :id, :user_id, :type, :image_id, :comment, :created_at, :updated_at
json.url post_image_url(post_image, format: :json)
