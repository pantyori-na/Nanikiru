json.extract! report, :id, :user_id, :comment, :type, :created_at, :updated_at
json.url report_url(report, format: :json)
