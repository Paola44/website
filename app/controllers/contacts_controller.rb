class ContactsController < ApplicationController

  def index
    # @contact = params[:contact]
  end

  def create
    UserMailer.contact(params).deliver_now
    redirect_to contact_path(@contact), notice: "Email has been succesfully sent to Larvol Veri. Thank you"
  end

  def show
  end

  private

  def contact_params
    params.require(:contact).permit(:fullname, :email, :message)
  end
end
