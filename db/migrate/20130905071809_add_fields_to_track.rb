class AddFieldsToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :soundcloud_id, :integer
    add_column :tracks, :permalink_url, :string
    add_column :tracks, :download_url, :string,
      default: "Not available yet"
    add_column :tracks, :artwork_url, :string,
      default: 'https://i1.sndcdn.com/artworks-000055452316-se7lpm-large.jpg?aa1a7cb'
    add_reference :tracks, :campaign, index: true
  end
end
