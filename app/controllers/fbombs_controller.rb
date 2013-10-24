class FbombsController < ApplicationController
  require 'tweetstream'
  respond_to :html, :json, :js
  def home
    TweetStream.configure do |config|
      config.consumer_key       = TWITTER_CONFIG['consumer_key']
      config.consumer_secret    = TWITTER_CONFIG['consumer_secret']
      config.oauth_token        = TWITTER_CONFIG['oauth_token']
      config.oauth_token_secret = TWITTER_CONFIG['oauth_token_secret']
      config.auth_method        = :oauth
    end
    track
  end
  def track
    Thread.new do
      puts "in thread"
      TweetStream::Client.new.track('fuck','fucker') do |tweet|
        puts "tracking"
        if tweet.geo
          geoTweet = {
            :tweets => [
              :text => tweet.text,
              :coordinates => tweet.geo.coordinates
            ]
          }
          File.open("public/data/data.json","w") do |f|
            f.write(geoTweet.to_json)
          end
          puts "BOOM! Fbomb!"
        end
      end
    end
  end
end