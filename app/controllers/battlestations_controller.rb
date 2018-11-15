class BattlestationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_battlestation, only: [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @battlestations = User.find(params[:user_id]).battlestations
    else
      @battlestations = Battlestation.all
    end
  end

  def show
  end

  def new
    @battlestation = Battlestation.new
  end

  def create
    @battlestation = current_user.battlestations.build(battlestation_params)
    if @battlestation.save
      flash[:success] = "Battlestation successfuly created!"
      redirect_to battlestation_path(@battlestation)
    else
      flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @record.errors.full_messages.join("<br/>").html_safe
      render :new
    end
  end

  def edit
  end

  def update
    if @battlestation.user == current_user
      @battlestation.update(battlestation_params)
      if @battlestation.save
        flash[:success] = "Battlestation successfuly updated!"
        redirect_to battlestation_path(@battlestation)
      else
        flash.now[:message] = "<strong>Please try again. There were some errors:</strong><br>".html_safe + @record.errors.full_messages.join("<br/>").html_safe
        render :new
      end
    else
      flash[:message] = "You don't have permission to do that"
      redirect_to root_path
    end
  end

  def destroy
    if @battlestation.user == current_user
      @battlestation.delete
      flash[:success] = "Battlestation successfuly deleted!"
      redirect_to user_battlestations_path(current_user)
    else
      flash.now[:message] = "You don't have permision to do that!"
      redirect_to root_path
    end
  end

  private

    def find_battlestation
      @battlestation = Battlestation.find_by(id: params[:id])
    end
    
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
