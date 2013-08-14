class CreateSoundcloudAccounts < ActiveRecord::Migration
  def change
    create_table :soundcloud_accounts do |t|
      t.string :access_token
      t.string :refresh_token
      t.string :soundcloud_avatar
      t.string :soundcloud_profile
      t.string :soundcloud_uid
      t.string :soundcloud_username
      t.string :token_expires
      t.timestamps
    end
  end
end
