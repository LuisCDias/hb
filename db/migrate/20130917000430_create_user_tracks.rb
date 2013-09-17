class CreateUserTracks < ActiveRecord::Migration
  def change
    create_table :user_tracks do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :upload_id
      t.timestamps
    end
  end
end
