class Season < ApplicationRecord
	has_many	:gigs
	belongs_to	:venue
end
