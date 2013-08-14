class ArtistLoungesController < AuthorizedController
  def show
    @campaigns = current_user.musician.campaigns
  end
end
