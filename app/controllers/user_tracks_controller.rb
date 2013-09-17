class UserTracksController < ApplicationController
  before_action :set_user_track, only: [:show, :edit, :update, :destroy]

  # GET /user_tracks
  def index
    @user_tracks = current_user.user_tracks
  end

  # GET /user_tracks/1
  def show
  end

  # GET /user_tracks/new
  def new
    @user_track = user.user_tracks.new
  end

  # GET /user_tracks/1/edit
  def edit
  end

  # POST /user_tracks
  def create
    @user_track = user.user_tracks.new(user_track_params)

    if @user_track.save
      redirect_to @user_track, notice: 'User track was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /user_tracks/1
  def update
    if @user_track.update(user_track_params)
      redirect_to @user_track, notice: 'User track was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /user_tracks/1
  def destroy
    @user_track.destroy
    redirect_to user_tracks_url, notice: 'User track was successfully destroyed.'
  end

  private

    def user
      current_user
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user_track
      @user_track = UserTrack.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_track_params
      params.require(:user_track).permit(:name, :description, :category_id, :user_id)
    end
end
