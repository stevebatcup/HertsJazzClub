class NewsletterSubscriber < ApplicationRecord
	validates_uniqueness_of	:email, message: "That email address is already on our list"
end
