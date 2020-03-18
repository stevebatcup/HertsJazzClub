class HomeController < ApplicationController
	def index
		@content = PageContent.find_by(page: "home")
		if should_assign_gigs
			@next_gig = Gig.next
			@upcoming_gigs = Gig.upcoming(3, @next_gig.starts.strftime("%Y-%m-%d %H:%M:%S"))
		end
	end

private

	def should_assign_gigs
		(Season.current_season || Season.next_season) && Gig.next
	end
end