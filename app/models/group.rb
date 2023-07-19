class Group < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :group_items, dependent: :destroy
  has_many :items, through: :group_items, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def add_unique_item(item)
    items << item unless items.include?(item)
  end

  def group_item
    total = 0
    items.each do |item|
      total += item.amount
    end
    total
  end
end
