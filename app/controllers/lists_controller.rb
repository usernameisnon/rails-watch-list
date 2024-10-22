class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      # redirect_to new_list_path, status: :unprocessable_entity
      render :new, status: 422
    end
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
    @bookmarks = @list.bookmarks
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
