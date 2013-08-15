class LaunchbasesController < AuthorizedController
  def show
    @launchbase = Launchbase.new current_user
  end
end
