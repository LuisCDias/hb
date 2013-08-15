class ArtistLoungesController < AuthorizedController
  def show
    @lounge = ArtistLounge.new(musician)
  end

  private

  def musician
    current_user.musician
  end
end
