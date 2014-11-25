class LegacyCardsController < ApplicationController
  before_action :set_card, only: [:destroy]

  # DELETE /legacy_cards/1
  # DELETE /legacy_cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = LegacyCard.find(params[:id])
    end
end
