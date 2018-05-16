require "administrate/field/base"

class PerformanceField < Administrate::Field::HasMany
  def to_s
    data
  end

  def selected_options
    selected = []
    data.each do |p|
      selected << "#{p.musician_id}_#{p.instrument_id}"
    end
    selected
  end

  def associated_resource_options
  	musicians = Musician.includes(:instruments).references(:instruments).all
  	out = []
    type = associated_class.to_s.downcase

  	musicians.each do |musician|
  		musician.instruments.each do |instrument|
	  		out << ["#{musician.full_name} --> #{instrument.name}", "#{musician.id}_#{instrument.id}"]
	  	end
  	end
  	out
  end

end
