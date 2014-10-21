class PriceController < ApplicationController
  # GET /price
  # GET /price.json
  def index
      @rate = Rate.last;
      @cost = (params[:width].to_f*params[:height].to_f* params[:lenght].to_f * params[:weight].to_f )  /  (( @rate.constant)   +  (@rate.K_value) % params[:value].to_f );
      @cost = @cost.round(2);
    
    render json: @cost
  end
  
  private

    def package_params
      #params.require(:package).permit(:sender_id, :receiver_id, :sender_agency_id, :receiver_agency_id, :status, :dispatched_at, :delivered_at, :lenght, :width, :height, :weight, :value)
      params.permit(:lenght, :width, :height, :weight, :value)
    end
end
