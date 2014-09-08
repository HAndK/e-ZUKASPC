#!/usr/bin/env ruby
#puts 'EventMachine::run 1'

require 'rubygems'
require 'bundler'
require 'json'

require "bundler/setup"
require "twitter"
require "net/http"
require "uri"

Bundler.require
puts 'EventMachine::run 1'

# Patch for twitter gem
require File.expand_path("../lib/ext/twitter", File.dirname(__FILE__))
$stdout.sync = true
puts 'EventMachine::run before!!'

EventMachine::run {
  puts 'EventMachine::run'

  twitter_client = Twitter::Streaming::Client.new do |config|
    puts "********* init **********"
    config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token = ENV["TWITTER_OAUTH_TOKEN"]
    config.access_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
  end

  twitter_client.filter(:track => 'ezaka') do |tweet|
    puts "-> tweet!!"
    next if tweet.lang != "ja" && tweet.user.time_zone != "Tokyo"
    params = { tweet: {} }
    params[:tweet][:text] = tweet.text
    params[:tweet][:screen_name] = tweet.user.screen_name
    params[:tweet][:icon_url] = tweet.user.profile_image_url
    p params[:tweet]

    # @client.post("/streaming", params.to_query)
  end
}