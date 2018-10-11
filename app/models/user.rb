class User < ApplicationRecord
	#アソシエーション
	has_many :cards
	has_many :cardfavs
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
