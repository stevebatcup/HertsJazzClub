require "administrate/field/base"

class FroalaField < Administrate::Field::Base
  def to_s
    data
  end
end
