Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['rRlcGt6kZg3tZNb9kg0Zme5Zm'], ENV['B5QH2TZzndzefvRrbRIon2Z2pApo7Aasn5RAscer71159cDZko']
end