class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @reference = Reference.new
  end

  def edit
  end

  def create
    @reference = Reference.new(reference_params)

    respond_to do |format|
      if @reference.save
        format.html { redirect_to @reference, notice: 'reference was successfully created.' }
        format.json { render :show, status: :created, location: @reference }
      else
        format.html { render :new }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to @reference, notice: 'reference was successfully updated.' }
        format.json { render :show, status: :ok, location: @reference }
      else
        format.html { render :edit }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @reference.destroy
  #   respond_to do |format|
  #     format.html { redirect_to references_url, notice: 'reference was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy

    redirect_to references_path
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference
      @reference = Reference.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reference_params
      params.require(:reference).permit(:name, :description, :picture)
    end
end
