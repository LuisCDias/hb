class Launchbase
  def initialize(user)
    @user = user
  end

  def reserved_campaigns
    @user.reserved_campaigns
  end

  def reservation_date(reserved_campaign)
    reservation = reserved_campaign.reservations.where(user: @user).first
    reservation.created_at
  end

  def link_for_campaign(reserved_campaign)
    if reserved_campaign.successful?
      reserved_campaign.track_permalink
    else
      'Not available yet'
    end
  end
end
