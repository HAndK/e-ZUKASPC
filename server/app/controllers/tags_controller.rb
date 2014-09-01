class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
  end
  
  private
    def set_tag
      @tag = Tag.find(params[:id])
    end
  
    def tag_params
      params.require(:tag).permit(:name)
    end
end
