class ReservationObserver < ActiveRecord::Observer
  observe :reservation

  def after_create(reservation)
    check_if_reservation_campaign_is_successful reservation.campaign
  end

  private

  def check_if_reservation_campaign_is_successful(campaign)
    if campaign.successful?
      SuccessfulCampaignPolicy.new(campaign).process
    end
  end
end
