class NewsletterController < ApplicationController
	def new
	end

	def create
		# url = "http://www.serifwebresources.com/control.php?lang=en&uid=76b90d30af30d888a10656c2c1c562e2f66a9b6d&swr_base=http://hertsjazz.co.uk/index.html&noschemecolours=1control.php?uid=76b90d30af30d888a10656c2c1c562e2f66a9b6d&action=joinlist&email=#{params[:email].strip}"
		# if open(url).read
		subscriber = NewsletterSubscriber.new({ email: params[:email] })
		if subscriber.save
			flash[:notice] = "Thank you. You will now receive our newsletters in your inbox."
		else
			flash[:alert] = "Sorry there was an error signing you up. #{subscriber.errors[:email].first}"
		end
		render	:new
	end
end