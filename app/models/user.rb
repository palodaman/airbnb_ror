class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :wishlists, dependent: :destroy # a property can have many wishlists by multiple users
  has_many :wishlisted_properties, through: :wishlist, source: :property, dependent: :destroy


end
