# == Schema Information
#
# Table name: categories
#
#  id                   :integer          not null, primary key
#  category_description :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Category < ActiveRecord::Base
  validates :category_description,
             presence: true

  validates :category_description, uniqueness: true

  has_and_belongs_to_many :products
end
