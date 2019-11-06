json.extract! game_record, :id, :user_id, :handle_name, :type, :ability, :game_name, :created_at, :updated_at
json.url game_record_url(game_record, format: :json)
