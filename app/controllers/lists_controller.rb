class ListsController < ApplicationController
	def index
		@lists = List.all
	end

	def show
		@list = List.find(params[:id])
	end

	def new
		@list = List.new
	end

	def edit
		@list = List.find(params[:id])
	end

	def update
		@list = List.find(params[:id])

		if @list.update(list_params)
		  redirect_to @list, notice: 'La liste a été mise à jour.'
		else
		  render :edit, status: :unprocessable_entity
		end
	end

	def create
		@list = List.new(list_params)
		if @list.save
		  redirect_to @list, notice: 'La liste à bien été créée'
		else
		  render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@list = List.find(params[:id])
		@list.destroy
		redirect_to lists_path, status: :see_other,
		notice: "La liste a été supprimée"

	end

	private

	def list_params
		params.require(:list).permit(:name, :image)
	end
end
