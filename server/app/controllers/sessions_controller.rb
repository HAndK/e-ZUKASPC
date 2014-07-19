class SessionsController < ApplicationController
  def create
    session['twitter_token'] = request.env['omniauth.auth']['credentials']['token']
    session['twitter_secret'] = request.env['omniauth.auth']['credentials']['secret']
    
    redirect_to tags_url
  end
end
