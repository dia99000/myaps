class DescriptionsController < ApplicationController
	before_action :set_desc, only: [:update, :delete]


  def create
    @card = Card.find(params[:card_id])
    @desc = Description.new(desc_params)
    respond_to do |format|
      if @desc.save!
        format.html { redirect_to controller: 'cards', action: 'show', id: @card.id, notice: 'Appended!' }
        format.json { render :show, status: :created, location: @desc }
      else
        format.html { render "cards/show" }
        format.json { render json: @desc.errors, status: :unprocessable_entity }
      end
    end
  end



  private

  def set_desc
    @desc = Description.find(params[:id])
  end

  def desc_params
		params.require(:description).permit(:content).merge(card_id: params[:card_id])
	end
end