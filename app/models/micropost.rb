class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.mcrposts_maxlength}
  validate  :picture_size

  scope :newest, ->{order(created_at: :desc)}
  mount_uploader :picture, PictureUploader

  private

  # Validates the size of an uploaded picture.
  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, t("microposts.picture_size_msg")
  end
end
