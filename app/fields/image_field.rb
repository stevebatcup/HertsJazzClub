require "administrate/field/base"

class ImageField < Administrate::Field::Base
  def to_s
    data
  end

  def small
  	data.small unless data.nil?
  end

  def large
  	data.large unless data.nil?
  end
end
