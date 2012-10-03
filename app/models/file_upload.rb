class FileUpload < ActiveRecord::Base
before_save :upload_save

  attr_accessible :filelink
  belongs_to :user
  mount_uploader :filelink, CloudFileUploader
  validates_presence_of :filelink
    def upload_save
  	self.name = File.basename(self.filelink_url, '.*')
    self.name = name.gsub("_", " ")
    self.filetype = File.extname(self.filelink_url)
	end

end
