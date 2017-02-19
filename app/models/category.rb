# == Schema Information
#
# Table name: categories
#
#  id                   :integer          not null, primary key
#  category_description :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  name                 :text             not null
#

class Category < ActiveRecord::Base
  validates :name,
            :category_description,
             presence: true

  validates :name, uniqueness: true

  has_and_belongs_to_many :products
end
