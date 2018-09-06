module Admin
  class GigsController < Admin::ApplicationController
    before_action :default_params

    def default_params
      params[:order] ||= "created_at"
      params[:direction] ||= "desc"
    end

    def create
      parameters = gig_params.clone
      parameters.delete :performance_ids
      parameters.delete :children
      gig = Gig.new(parameters)
      create_performances(gig)
      create_double_bills(gig)
      if gig.save
        redirect_to(
          [namespace, gig],
          notice: translate_with_resource("create.success"),
        )
      else
        render :new, locals: {
          page: Administrate::Page::Form.new(dashboard, gig),
        }
      end
    end

    def update
      gig = Gig.find(params[:id])
      gig.performances.destroy_all
      create_performances(gig)
      create_double_bills(gig)
      if gig.update(gig_params)
        redirect_to(
          [namespace, gig],
          notice: translate_with_resource("update.success"),
        )
      else
        render :edit, locals: {
          page: Administrate::Page::Form.new(dashboard, gig),
        }
      end
    end

private

    def gig_params
      gig_parameters = params.require(:gig).permit!
      gig_parameters[:starts] = DateTime.parse(gig_parameters[:starts].to_s)
      gig_parameters[:ends] = DateTime.parse(gig_parameters[:ends].to_s) if gig_parameters[:ends].length > 0
      gig_parameters
    end

    def create_performances(gig)
      gig_params[:performance_ids].each do |pid|
        if pid.length > 0
          ids = pid.split("_")
          gig.performances.build({musician_id: ids[0], instrument_id: ids[1]})
        end
      end
      gig_params.delete :performance_ids
    end

    def create_double_bills(gig)
      if gig_params[:children].to_i > 0
        gig.build_child_billing({child_id: gig_params[:children].to_i})
      else
        gig.child_billing.destroy if gig.child_billing
      end
      gig_params.delete :children
    end

  end
end
