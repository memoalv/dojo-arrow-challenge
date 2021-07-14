module Arrows
  class ArrowsController < Arrows::BaseController
    def show; end

    def create
      @arrow = current_user.sent_arrows.build(arrow_params)

      if @arrow.save
        redirect_to arrows_root_path, notice: 'Arrow sent successfully'
      else
        redirect_to arrows_root_path, alert: 'An error ocurred when creating the arrow'
      end
    end

    private

    def arrow_params
      params.require(:arrow).permit(:to_user_id, :content)
    end
  end
end
