class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  validate :can_not_empty
  mount_uploader :image, ImageUploader

  def can_not_empty
    errors.add(:text, "を入力してください") unless text && image
  end
end
