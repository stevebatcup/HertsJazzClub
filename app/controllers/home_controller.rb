class HomeController < ApplicationController
	def index
		@upcoming_gigs = []
		if @next_gig = Gig.next
			@upcoming_gigs = Gig.upcoming(3, "'#{@next_gig.ends.strftime("%Y-%m-%d")}'")
		end
	end
end