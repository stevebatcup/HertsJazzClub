class Season < ApplicationRecord
	has_many	:gigs
	belongs_to	:venue

	default_scope	{ order(year: :desc).order(id: :desc) }

	def full_name
		"#{name} #{year}"
	end
end
