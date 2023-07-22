class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :group_items, dependent: :destroy
  has_many :items, through: :group_items, dependent: :destroy

  include ImageUploader::Attachment(:icon)

  validates :name, presence: true
end
