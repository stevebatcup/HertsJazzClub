class HomeController < ApplicationController
	def index
		@upcoming_gigs = Gig.upcoming(3)
	end
end