class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listings_params)
		if @listing.save
			redirect_to @listing
		else
			render "new"
		end
	end
	
	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update(listings_params)
			redirect_to listings_path
		else
			render "edit"
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	private
	def listings_params
		params.require(:listing).permit(:name, :location, :price)
	end
end
