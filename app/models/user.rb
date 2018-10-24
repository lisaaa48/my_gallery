class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: {minimum:2, maximum:20}

  has_many :my_galleries, dependent: :destroy
  has_many :visits, dependent: :destroy
end
