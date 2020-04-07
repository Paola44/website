class WebsController < ApplicationController
  before_action :set_web, only: [:show, :edit, :update, :destroy]

  def index
    @webs = Web.all
  end

  def show
  end

  def new
    @web = Web.new
  end

  def edit
  end

  def create
    @web = Web.new(web_params)

    respond_to do |format|
      if @web.save
        format.html { redirect_to @web, notice: 'Web was successfully created.' }
        format.json { render :show, status: :created, location: @web }
      else
        format.html { render :new }
        format.json { render json: @web.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @web.update(web_params)
        format.html { redirect_to @web, notice: 'Web was successfully updated.' }
        format.json { render :show, status: :ok, location: @web }
      else
        format.html { render :edit }
        format.json { render json: @web.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @web.destroy
    respond_to do |format|
      format.html { redirect_to webs_url, notice: 'Web was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web
      @web = Web.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def web_params
      params.fetch(:web, {})
    end
end
