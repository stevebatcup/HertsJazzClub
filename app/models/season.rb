class Season < ApplicationRecord
	has_many	:gigs
	belongs_to	:venue

	def full_name
		"#{name} #{year}"
	end
end
