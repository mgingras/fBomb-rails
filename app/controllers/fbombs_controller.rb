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
    # TweetStream::Daemon.new().track('fuck','fucker') do |tweet|
    #   if tweet.geo
    #     puts tweet.id
    #     tweet = tweet.text
    #     puts text
    #     puts tweet.geo.coordinates
    #   end
    # end
    track
  end
  def track
    Thread.new do
      TweetStream::Client.new.track('fuck','fucker') do |tweet|
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
          # respond_to do |format|
              # The action 'vote' is called here.
              # render :js => "alert('Hello Rails');"
            # end
          # render js: "alert('Hello Rails');"

          # render :text => proc { |response, output| output.write("Hello from code!") }
          # puts tweet.text
          # puts tweet.id.class
          # tweet = tweet.text
          # @tweets[tweet.id] = tweet.geo.coordinates
          # puts tweet.geo.coordinates.class
          # @tweets.push tweet.geo.coordinates
        end
      end
    end
  end
  def tweets
    puts "here"
    # responds_to |format|
    # format.html { render :json => }
    # puts "THIS SHIT GOT CALLED"
    # render :json => 
    # @tweets.each do |value|
    # puts tweet
    render :nothing => true
  end
end