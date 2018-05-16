class SeasonsController < ApplicationController
	def show
		if request.path.include?('current-season')
			@is_current = true
			@season = Season.where(is_current: true).first
		else
			@season = Season.find(params[:id])
			redirect_to current_season_path if @season.is_current
			@is_current = false
		end
	end
end