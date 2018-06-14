class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.mcrposts_maxlength}
  validate  :picture_size

  scope :newest, ->{order(created_at: :desc)}
  scope :find_by_ids, ->(following_ids, id){where "user_id IN (?) OR user_id = ?", following_ids, id}
  mount_uploader :picture, PictureUploader

  private

  # Validates the size of an uploaded picture.
  def picture_size
    return unless picture.size > Settings.picture_size.megabytes
    errors.add :picture, I18n.t("microposts.picture_size_msg")
  end
end
