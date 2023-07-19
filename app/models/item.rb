class Item < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :group_items
  has_many :groups, through: :group_items

  validates :name, presence: true
  validates :amount, presence: true


  def add_group
    groups.length ||= 0
  end

  def add_unique_group(item)
    groups << item unless groups.include?(item)
  end
end
