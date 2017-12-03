class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validate :avoid_empty_message
  mount_uploader :image, ImageUploader

  def avoid_empty_message
    errors.add(:text, "を入力してください") unless text && image
  end
end
