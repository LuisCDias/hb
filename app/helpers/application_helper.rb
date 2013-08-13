module ApplicationHelper
  def navigation_for(user)
    if user.nil?
      render 'visitor_nav'
    else
      render 'nav'
    end
  end

  def campaign_controls_for(campaign, user)
    if campaign.is_available_for? user
      reserve_campaign_button campaign
    else
      campaign_reserved_button
    end
  end

  def reserve_campaign_button(campaign)
    button_to 'Make it launch faster',
      campaign_reservations_path(campaign)
  end

  def campaign_reserved_button
    button_tag 'Reserved', inactive: true
  end
end
