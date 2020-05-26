class InteractionsController < ApplicationController
  def show
    @interaction = Interaction.find(params[:id])
  end

  def destroy
    @interaction.destroy
    redirect_to interactions_path
  end
end
