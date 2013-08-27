class RenameTracktoLocalTrack < ActiveRecord::Migration
  def change
    rename_table :tracks, :local_tracks
  end
end
