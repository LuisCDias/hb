class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.search(params[:search]).paginate(:per_page => 8, :page => params[:page])
  end

  def new
    @campaign = musician.campaigns.build
  end

  def create
    campaign = musician.campaigns.build(campaign_params)
    if campaign.save
      redirect_to music_path, notice: 'Campaign created!'
    else
      render 'new'
    end
  end

  def show
    @campaign = Campaign.find(params[:id])
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
