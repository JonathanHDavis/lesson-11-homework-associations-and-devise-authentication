class TagsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tags_params)

    if @tag.save
      redirect_to tag_path(@tag), notice: "Tag was successfully created"
    else
      flash.now[:error] = "An error occurred when saving this Tag"
      render :new
    end
  end

  def edit
  end

  def update
    if @tag.update(tags_params)
      redirect_to tag_path(@tag), notice: "Tag was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this Tag"
      render :edit
    end
  end

  def destroy
    @tag.destroy

    redirect_to tags_path, notice: "Tag was successfully deleted"
  end

  private

  def find_tag
    @tag = Tag.find(params[:id])
  end

  def tags_params
    params.require(:tag).permit(:name)
  end
end

