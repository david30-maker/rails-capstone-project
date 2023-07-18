class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         before_create :name_decoration

  has_many :groups, class_name: 'Group', foreign_key: :user_id, dependent: :destroy
  has_many :items, class_name: 'Item', foreign_key: 'author_id', dependent: :destroy
  

  validates :name, presence: true, length: { maimum: 250, minimum: 2 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  private

  def name_decoration
    self.name = name.capitalize if name.blank?
  end

end
