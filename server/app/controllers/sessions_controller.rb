class SessionsController < ApplicationController
  def create
    @auth = Twitter.new(request.env['omniauth.auth'])
  end
end
