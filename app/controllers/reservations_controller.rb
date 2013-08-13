class ReservationsController < AuthorizedController
  def create
    Reservation.reserve_campaign_for current_user, campaign

    redirect_to music_path, notice: 'Campaign reserved'
  end

  private

  def campaign
    Campaign.find params[:campaign_id]
  end
end
