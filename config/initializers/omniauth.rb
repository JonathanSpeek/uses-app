Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.credentials.github[:github_key], Rails.application.credentials.github[:github_secret], scope: "user:email"
end