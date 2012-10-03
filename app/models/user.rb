class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :file_uploads
  attr_accessible :login, :email, :password, :password_confirmation
  acts_as_authentic
end
