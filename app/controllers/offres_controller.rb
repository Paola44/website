class OffresController < ApplicationController

  def index
  end

  def show
  end

  def create
    UserMailer.contact(params).deliver_now
    redirect_to contact_path(@contact), notice: "Email has been succesfully sent to Larvol Veri. Thank you"
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def contact_params
    params.require(:offre).permit(:fullname, :email, :message)
  end
end
