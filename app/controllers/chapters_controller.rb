class ChaptersController < ApplicationController
	before_action :find_chapter, only: [:show, :edit, :update, :destroy]
	
	def index
		@chapters = Chapter.all
	end

	def new
		@chapter = Chapter.new
	end

	def create
		@chapter = Chapter.new(chapter_params)
		if @chapter.save
		redirect_to chapters_path
		else
			render :new
		end
	end

	def show
	end

	def edit 
	end

	def update
		if @chapter.update(chapter_params)
			redirect_to chapters_path
		else
			render :edit
		end
	end

	def destroy
		@chapter.destroy
		redirect_to chapters_path
	end


	private

	def find_chapter
		@chapter = Chapter.find(params[:id])
	end

	def chapter_params
		params.require(:chapter).permit(:name)
	end
end
