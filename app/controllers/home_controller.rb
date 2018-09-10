class HomeController < ApplicationController
	def index
		@content = PageContent.find_by(page: "home")
		@upcoming_gigs = []
		if @next_gig = Gig.next
			@upcoming_gigs = Gig.upcoming(3, @next_gig.starts.strftime("%Y-%m-%d %H:%M:%S"))
		end
	end
end