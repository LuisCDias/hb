module ApplicationHelper
  def navigation_for(user)
    if user.nil?
      render 'visitor_nav'
    elsif user.musician?
      render 'musician_nav'
    else
      render 'fan_nav'
    end
  end

  def campaign_controls_for(campaign, user)
    if campaign.is_available_for?(user)
      reserve_campaign_button campaign
    elsif campaign.musician.user == user
      campaign_owner_button campaign
    else
      campaign_reserved_button
    end
  end

  def campaign_owner_button(campaign)
    link_to 'Your awesome campaign',
      campaign_path(campaign),
      class: 'btn btn-info'
  end

  def reserve_campaign_button(campaign)
    button_to 'Make it launch faster',
      campaign_reservations_path(campaign),
      class: 'btn btn-info'
  end

  def campaign_reserved_button
    button_tag 'Reserved', inactive: true,
      class: 'btn btn-info'
  end
end
