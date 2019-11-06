json.extract! site_report, :id, :comment, :type, :created_at, :updated_at
json.url site_report_url(site_report, format: :json)
