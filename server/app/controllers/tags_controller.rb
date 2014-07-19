class TagsController < ApplicationController
  def index
    @tag = Tag.first
  end
end
