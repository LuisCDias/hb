class AdviceRequestsController < ApplicationController
  before_action :set_advice_request, only: [:show, :edit, :update, :destroy]

  # GET /advice_requests
  def index
    @advice_requests = AdviceRequest.all
    @user_advice_requests = current_user.advice_requests
  end

  # GET /advice_requests/1
  def show
  end

  # GET /advice_requests/new
  def new
    @advice_request = user.advice_requests.new
  end

  # GET /advice_requests/1/edit
  def edit
  end

  # POST /advice_requests
  def create
    @advice_request = user.advice_requests.build(advice_request_params)

    if @advice_request.save
      redirect_to @advice_request, notice: 'Advice request was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /advice_requests/1
  def update
    if @advice_request.update(advice_request_params)
      redirect_to @advice_request, notice: 'Advice request was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /advice_requests/1
  def destroy
    @advice_request.destroy
    redirect_to advice_requests_url, notice: 'Advice request was successfully destroyed.'
  end

  private

   def user
    current_user
  end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_advice_request
      @advice_request = AdviceRequest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def advice_request_params
      params.require(:advice_request).permit(:comment, :category_id, :user_id, :drums, :bass, :vocals, :synths, :structure, :effects, :mixing, :master, :track_url)
    end
end
