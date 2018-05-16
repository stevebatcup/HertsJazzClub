class Performance < ApplicationRecord
	belongs_to	:gig
	belongs_to	:musician
	belongs_to	:instrument

	def playing
		"#{self.musician.full_name} (#{self.instrument.name})"
	end

end