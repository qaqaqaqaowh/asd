class ListingsController < ApplicationController
	before_action :set_listing, only: [:edit, :update, :show, :destroy]

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
	end

	def update
		if @listing.update(listings_params)
			redirect_to listings_path
		else
			render "edit"
		end
	end

	def show
	end

	def destroy
		if @listing.destroy
			redirect_to listings_path
		else
			redirect_to @listing
		end
	end

	def mylistings
		@listings = current_user.listings
		render "index"
	end

	private
	def listings_params
		params.require(:listing).permit(:name, :location, :price)
	end

	def set_listing
		@listing = Listing.find(params[:id])
	end
end
