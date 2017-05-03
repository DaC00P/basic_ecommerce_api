class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :validatable, :recoverable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable
end
