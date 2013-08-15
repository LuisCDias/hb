class UserSettingsController < AuthorizedController
  def show
    @user = current_user
  end
end
