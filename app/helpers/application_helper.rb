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
      campaign_already_launched_button campaign
    elsif campaign_available_for_reservation? campaign, user
      reserve_campaign_button campaign
    else
      campaign_reserved_button campaign
    end
  end

  def reserve_campaign_button(campaign)
    link_to "Launch this sound <i class='icon-rocket'></i>".html_safe,
      campaign_reservations_path(campaign), method: :POST,
      class: 'btn btn-info btn-block'
  end

  def campaign_reserved_button(campaign)
    link_to "Reserved - Share to launch faster <i class='icon-time'></i>".html_safe,
      campaign_path(campaign),
      class: 'btn btn-info btn-block'
  end

  def campaign_already_launched_button(campaign)
    if current_user
       link_to "Launched, Download Now <i class='icon-download'></i>".html_safe, campaign.track_permalink,
      :target => "_blank",
      class: 'btn btn-info btn-block'
     else
      link_to "Sign in to Download <i class='icon-heart-empty'></i>".html_safe, new_user_session_path,
      class: "btn btn-info btn-block"
    end
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