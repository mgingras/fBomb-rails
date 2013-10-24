unless Rails.env.production?
  TWITTER_CONFIG = YAML.load_file(Rails.root.join("config/twitter.yml"))[Rails.env]
end