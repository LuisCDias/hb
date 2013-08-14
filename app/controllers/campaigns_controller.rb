class CampaignsController < ApplicationController
  def index
    @campaigns = Campaign.all
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

  private

  def musician
    current_user.musician
  end

  def campaign_params
    params.require(:campaign).permit(
      :category_id,
      :full_track,
      :musician_name,
      :name,
      :requested_likes,
      :track_id
    )
  end
end
