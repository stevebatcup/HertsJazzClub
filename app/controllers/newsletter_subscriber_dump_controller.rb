class NewsletterSubscriberDumpController < Admin::ApplicationController
	def index
		@subscribers = NewsletterSubscriber.order(created_at: :desc)
	end
end
