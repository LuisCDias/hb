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
    if campaign.successful?
      campaign_already_launched_button
    elsif campaign_available_for_reservation? campaign, user
      reserve_campaign_button campaign
    else
      campaign_reserved_button
    end
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

  def campaign_already_launched_button
    button_tag 'Already Launched', inactive: true,
      class: 'btn btn-info'
  end

  private

  def campaign_available_for_reservation?(campaign, user)
    true if campaign.is_available_for?(user) &&
      campaign_is_not_owned_by?(campaign, user)
  end

  def campaign_is_not_owned_by?(campaign, user)
    true if campaign.musician.user != user
  end
end
