class DropMusicianFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :musician
  end
end
