require 'rubygems'
require 'bundler'
require 'json'

Bundler.require

require 'twitter/json_stream'

# TwitterのAPIキー情報を環境変数から取得
TWITTER_CONSUMER_KEY        ||= ENV['TWITTER_CONSUMER_KEY']
TWITTER_CONSUMER_SECRET     ||= ENV['TWITTER_CONSUMER_SECRET']
TWITTER_OAUTH_TOKEN         ||= ENV['TWITTER_OAUTH_TOKEN']
TWITTER_OAUTH_TOKEN_SECRET  ||= ENV['TWITTER_OAUTH_TOKEN_SECRET']
FOLLOWS                     ||= ENV['FOLLOWS']

EventMachine::run {
  stream = Twitter::JSONStream.connect(
    # :path    => "/1.1/statuses/filter.json?follow=#{FOLLOWS}",
    :path    => "/1.1/statuses/filter.json?track=twitter",
    :oauth => {
      :consumer_key    => TWITTER_CONSUMER_KEY,
      :consumer_secret => TWITTER_CONSUMER_SECRET,
      :access_key      => TWITTER_OAUTH_TOKEN,
      :access_secret   => TWITTER_OAUTH_TOKEN_SECRET
    },
    :ssl => true
  )

  stream.each_item do |item|
    $stdout.print "item: #{item}\n"
    $stdout.flush
  end

  stream.on_error do |message|
    $stdout.print "error: #{message}\n"
    $stdout.flush
  end

  # 再接続は書いていないです。書いて教えてくださいw
  stream.on_reconnect do |timeout, retries|
    $stdout.print "reconnecting in: #{timeout} seconds\n"
    $stdout.flush
  end

  stream.on_max_reconnects do |timeout, retries|
    $stdout.print "Failed after #{retries} failed reconnects\n"
    $stdout.flush
  end
}