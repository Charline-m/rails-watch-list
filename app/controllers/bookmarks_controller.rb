class BookmarksController < ApplicationController

before_action :set_list

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
      redirect_to list_path(@bookmark.list)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy!
    redirect_to bookmarks_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])

  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end