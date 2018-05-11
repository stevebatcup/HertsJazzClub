class Performance < ApplicationRecord
	belongs_to	:gig
	belongs_to	:musician
	belongs_to	:instrument

	def playing
		"#{self.musician.name} (#{self.instrument.name})"
	end

end