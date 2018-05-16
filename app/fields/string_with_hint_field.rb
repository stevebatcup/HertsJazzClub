require "administrate/field/base"

class StringWithHintField < Administrate::Field::Base
  def to_s
    data
  end

  def hint
  	@options[:hint].html_safe
  end
end
