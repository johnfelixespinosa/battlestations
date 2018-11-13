class BattlestationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @battlestation = Battlestation.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    
    def battlestation_params
      params.require(:battlestation).permit(
        :name, 
        :cpu, 
        :cpu_cooler, 
        :motherboard, 
        :storage, 
        :video_card, 
        :case, 
        :power_supply, 
        :operating_system, 
        :monitor,
        images: []
      )
    end

end
