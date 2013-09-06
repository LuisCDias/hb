class CampaignsController < AuthorizedController
  skip_filter :authenticate_user!, only: [:index, :show]

  def index
    @campaigns = Campaign.search(params[:search]).
      order("created_at DESC").
      paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @campaign = musician.campaigns.build
  end

  def create
    @campaign = musician.campaigns.build(campaign_params)
    if @campaign.save
      LocalTrackFactory.new(@campaign).create
      redirect_to music_path, notice: 'Campaign created!'
    else
      render 'new'
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
    redirect_to artist_lounge_url, notice: 'Campaign deleted'
  end

  private

  def musician
    current_user.musician
  end

  def campaign_params
    params.require(:campaign).permit(
      :category_id,
      :musician_name,
      :name,
      :requested_likes,
      :track_id
    )
  end
end
