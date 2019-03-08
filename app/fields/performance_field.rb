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
    list = []
    already_selected_list = {}
    type = associated_class.to_s.downcase

    musicians.each do |musician|
      musician.instruments.each do |instrument|
        selected_performance_id = nil
        data.each do |performance|
          selected_performance_id = performance.id if performance.musician_id == musician.id && performance.instrument_id == instrument.id
        end
        item = ["#{musician.full_name} --> #{instrument.name}", "#{musician.id}_#{instrument.id}"]
        unless selected_performance_id.nil?
          already_selected_list[selected_performance_id] = item
        else
          list << item
        end
      end
    end
    already_selected_list = already_selected_list.sort.reverse.to_h

    already_selected_list.each do |selected_performance|
      list.unshift selected_performance[1]
    end

    list
  end
end
