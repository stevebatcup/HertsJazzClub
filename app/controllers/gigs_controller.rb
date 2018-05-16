class GigsController < ApplicationController
	def show
		@gig = Gig.find(params[:id])
	end
end