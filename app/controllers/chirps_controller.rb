class ChirpsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	
	def index
		@chirps = Chirp.all
	end

	def new	
		@chirp = Chirp.new
	end

	def edit	
	end

	def show
		@chirp = Chirp.find(params[:id])
	end

	def create
		@chirp = Chirp.new(params.require(:chirp).permit(:body).merge(user: current_user))
		if @chirp.save
			redirect_to root_path, notice: "New chirp created!"
		else
			render :new
		end
	end

	def update
	end

	def destroy
		@chirp = Chirp.find(params[:id])
		@chirp.destroy
		redirect_to root_path, alert: "Chirp deleted."
	end



end