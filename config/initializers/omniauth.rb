Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['bjmYz864PwOlnrVYwUqoyxeWm'], ENV['Zz2Km17lq1m0hPU52ke2RzK8ONTQdUGW34KWXbugfdV7iKvFxV']
end