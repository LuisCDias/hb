class Upload < ActiveRecord::Base
  has_attached_file :upload
  belongs_to :user
  has_one :user_track, :dependent => :destroy
  accepts_nested_attributes_for :user_track

  after_initialize do
    self.user_track ||= self.build_user_track()
  end

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

end
