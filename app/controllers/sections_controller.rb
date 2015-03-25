class SectionsController < ApplicationController

	def new	
		@chapter = Chapter.find(params[:chapter_id])
		@section = @chapter.sections.new
	end

	def create
		@chapter = Chapter.find(params[:chapter_id])
		@section = @chapter.sections.new(section_params)
		if @section.save
	     redirect_to chapter_path(@section.chapter)
    else
       render :new
    end
  end

  def edit
		@section = Section.find(params[:id])
	end

  def update
		@section = Section.find(params[:id])
		@section.update
		redirect_to chapters_path
	end
		
  def destroy 
  	@section = Section.find(params[:id])
		@section.destroy
		redirect_to chapters_path
	end

 private

  def section_params
    params.require(:section).permit(:name)
  end
end
