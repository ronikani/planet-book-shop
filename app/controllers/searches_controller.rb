class SearchesController < ApplicationController
	def new
		@search = Search.new
	end
	
	def create
		@search = Search.new(search_params)	
		if @search.save
			redirect_to @search
		end	
	end
	
	def show
		@search = Search.find(params[:id])
	end		

	private

	def search_params
       params.require(:search).permit(:keywords, :category_id, :author_id, :min_price, :max_price)
    end

end
