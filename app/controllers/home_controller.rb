class HomeController < ApplicationController
	def index
		@next_gig = Gig.next
		@upcoming_gigs = Gig.upcoming(3, "'#{@next_gig.ends.strftime("%Y-%m-%d")}'")
	end
end