class Season < ApplicationRecord
	has_many	:gigs
	belongs_to	:venue

	default_scope	{ order(year: :desc).order(id: :desc) }

	def full_name
		"#{name} #{year}"
	end

	def self.archive_list
		current_season = Season.where(is_current: true).first
		Season.where(is_current: false)
					.where("(year < #{current_season.year}) OR (year = #{current_season.year} AND id < #{current_season.id})")
	end
end
