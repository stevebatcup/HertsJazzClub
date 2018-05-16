class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def season_list
  	@season_list ||= Season.where(is_current: false).all.group_by(&:year)
  end
  helper_method :season_list

  def is_home?
  	@is_home ||= params[:controller] == 'home'
  end
  helper_method :is_home?
end
