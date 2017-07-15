class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validates :text, presence: true
  mount_uploader :image, ImageUploader
end
