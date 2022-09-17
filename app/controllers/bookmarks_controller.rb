class BookmarksController < ApplicationController
  before_action :find_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.movie = params[:movie_id]
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark)
  end

  private
  def find_list
    @list = List.find(params[:list_id])
  end
end
