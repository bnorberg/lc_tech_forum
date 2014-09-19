Rails.application.config.middleware.use OmniAuth::Builder do
  #production key
  provider :google_oauth2, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {access_type: 'online', approval_prompt: ''}
  #development key
  #provider :google_oauth2, ENV['LCTECH_G_KEY'], ENV['LCTECH_G_SECRET'], {access_type: 'online', approval_prompt: ''}
end