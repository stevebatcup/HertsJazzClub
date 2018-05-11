module Admin
  class GigsController < Admin::ApplicationController
    def create
      gig = Gig.new(act: gig_params[:act], season_id: gig_params[:season_id], date: gig_params[:date], description: gig_params[:description])
      create_performances(gig)
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
      params.require(:gig).permit!
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

  end
end
