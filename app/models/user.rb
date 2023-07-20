class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :name_decoration

  has_many :groups, class_name: 'Group', foreign_key: :user_id, dependent: :destroy
  has_many :items, class_name: 'Item', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 250 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }

  private

  def name_decoration
    self.name = name.capitalize if name.blank?
  end

  def case_sensitive_email_uniqueness
    return unless email_changed? && self.class.exists?(email:)

    errors.add(:email, 'has already been taken')
  end
end
