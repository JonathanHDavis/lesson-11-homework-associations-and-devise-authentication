class AuthorsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  
  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = "Author was successfully created"
      redirect_to author_path(@author)
    else
      flash.now[:error] = "An error occurred while saving this author"
      render :new
    end
  end

  def edit
  end

  def update
    if @auhtor.update(author_params)
      redirect_to author_path(@author), notice: "Author was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this Author"
      render :edit
    end
  end

  def destroy
    @author.destroy

    redirect_to authors_path, notice: "Author was successfully deleted"
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end


