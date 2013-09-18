class CreateAdviceRequests < ActiveRecord::Migration
  def change
    create_table :advice_requests do |t|
      t.text :comment
      t.integer :category_id
      t.integer :user_id
      t.string :track_url
      t.boolean :drums, default: false
      t.boolean :bass, default: false
      t.boolean :vocals, default: false
      t.boolean :synths, default: false
      t.boolean :structure, default: false
      t.boolean :effects, default: false
      t.boolean :mixing, default: false
      t.boolean :master, default: false

      t.timestamps
    end
  end
end
