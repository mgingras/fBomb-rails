class FbombController < ApplicationController
  require 'tweetstream'
  def home
    TweetStream.configure do |config|
      config.consumer_key       = TWITTER_CONFIG['consumer_key']
      config.consumer_secret    = TWITTER_CONFIG['consumer_secret']
      config.oauth_token        = TWITTER_CONFIG['oauth_token']
      config.oauth_token_secret = TWITTER_CONFIG['oauth_token_secret']
      config.auth_method        = :oauth
    end
  end
  def about
  end
  def contact
  end
end
# 
# Twitter.configure do |config|
#   config.consumer_key = YOUR_CONSUMER_KEY
#   config.consumer_secret = YOUR_CONSUMER_SECRET
#   config.oauth_token = YOUR_OAUTH_TOKEN
#   config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
# end