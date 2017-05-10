class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :validatable, :recoverable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable

  validates :user_first_name,
           :user_last_name,
           :email,
           :username,
           :presence => true

  validates :email,
            uniqueness: true,
            email_format: { message: 'email has invalid format' }

  has_many :orders

  has_many :order_items,
           through: :orders

  has_many :products,
           through: :order_items

  has_many :categories,
           through: :products
end
