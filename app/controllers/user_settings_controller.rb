class UserSettingsController < AuthorizedController
  def show
    @musician = current_user.musician
  end
end
