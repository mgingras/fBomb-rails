class FbombsController < ApplicationController
  require 'tweetstream'
  def home
    @tweets = Hash.new
    TweetStream.configure do |config|
      config.consumer_key       = TWITTER_CONFIG['consumer_key']
      config.consumer_secret    = TWITTER_CONFIG['consumer_secret']
      config.oauth_token        = TWITTER_CONFIG['oauth_token']
      config.oauth_token_secret = TWITTER_CONFIG['oauth_token_secret']
      config.auth_method        = :oauth
    end
    TweetStream::Daemon.new.track('fuck','fucker') do |tweet|
      if tweet.geo

        # puts tweet.id.class
        tweet = tweet.text
        @tweets[tweet.id] = tweet.geo.coordinates
        # puts tweet.geo.coordinates.class
        # @tweets.push tweet.geo.coordinates
      end
    end
      # track
  end
  def track
    @tracking_thread = Thread.new do
      TweetStream::Client.new.track('fuck','fucker') do |tweet|
        if tweet.geo

          # puts tweet.id.class
          tweet = tweet.text
          @tweets[tweet.id] = tweet.geo.coordinates
          # puts tweet.geo.coordinates.class
          # @tweets.push tweet.geo.coordinates
        end
      end
    end
  end
  def tweets
    # responds_to |format|
    # format.html { render :json => }
    # puts "THIS SHIT GOT CALLED"
    # render :json => 
    # @tweets.each do |value|
    puts tweet
    render :nothing => true
  end
end