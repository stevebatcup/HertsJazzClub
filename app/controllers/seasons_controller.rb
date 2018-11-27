class SeasonsController < ApplicationController
	def index
		if params[:season]
			redirect_to season_path(params[:season])
		else
			@seasons = Season.archive_list
		end
	end

	def show
		if request.path.include?('current-season')
			@is_current = true
			@is_next = false
			@season = Season.where(is_current: true).first
		elsif request.path.include?('next-season')
			@is_current = false
			@is_next = true
			@season = Season.where(is_next: true).first
		else
			@season = Season.find(params[:id])
			redirect_to current_season_path if @season.is_current
			redirect_to next_season_path if @season.is_next
			@is_current = false
			@is_next = false
		end
	end
end