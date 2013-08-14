class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
