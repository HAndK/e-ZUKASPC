#!/usr/bin/env ruby

require "bundler/setup"
require "active_support/core_ext/hash"
require "twitter"
require "net/http"
require "uri"

# Patch for twitter gem
require File.expand_path("../lib/ext/twitter", File.dirname(__FILE__))

$stdout.sync = true

class TwitterStreamingClient
  # def initialize(host, port)
  def initialize
    # @client = Net::HTTP.new(host, port)
    @twitter_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token = ENV["TWITTER_OAUTH_TOKEN"]
      config.access_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]

      p config
    end
  end

  def start
    puts "started!!"
    @twitter_client.track('e-zuka') do |tweet|
      puts "-> tweet!!"
      next if tweet.lang != "ja" && tweet.user.time_zone != "Tokyo"
      params = { tweet: {} }
      params[:tweet][:text] = tweet.text
      params[:tweet][:screen_name] = tweet.user.screen_name
      params[:tweet][:icon_url] = tweet.user.profile_image_url
      p params[:tweet]
      # @client.post("/streaming", params.to_query)
    end
  end
end

# if ARGV[0] == "start" && ARGV.length == 3
  TwitterStreamingClient.new().start
  # TwitterStreamingClient.new(ARGV[1], ARGV[2].to_i).start
# else
#   abort "Usage: twitter_streaming_client start <host> <port>"
# end
