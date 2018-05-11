class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def season_list
  	@season_list ||= Season.where(is_current: false).all.group_by(&:year)
  end
  helper_method :season_list
end
