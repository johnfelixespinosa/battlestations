class BattlestationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @battlestations = current_user.battlestations
  end

  def new
    @battlestation = Battlestation.new
  end

  def create
    @battlestation = Battlestation.new(battlestation_params)
    @battlestation.user = current_user
    if @battlestation.save
      flash[:success] = "Record successfuly created!"
      redirect_to battlestation_path(@battlestation)
    else
      flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @record.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  def show
    @battlestation = Battlestation.find_by_id(params[:id])
  end

  def edit
    @battlestation = Battlestation.find_by_id(params[:id])
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
        :image
      )
    end

end
