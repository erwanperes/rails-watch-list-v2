class BookmarksController < ApplicationController
	def new
		@list = List.find(params[:list_id])
		@bookmark = Bookmark.new
	end
	
	def create
		@list = List.find(params[:list_id])
		@bookmark = @list.bookmarks.build(bookmark_params)
		if @bookmark.save
		  redirect_to @list, notice: 'Le film à bien été ajouté'
		else
		  render :new, status: :unprocessable_entity
		end
	end
	
	def destroy
		@bookmark = Bookmark.find(params[:id])
		@list = @bookmark.list
		@bookmark.destroy
		redirect_to @list, notice: 'Le film à été supprimé', status: :see_other
	end
	
	private
	
	def bookmark_params
		params.require(:bookmark).permit(:movie_id, :comment)
	end
end
