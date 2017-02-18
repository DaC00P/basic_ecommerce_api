# == Schema Information
#
# Table name: products
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  description  :text             not null
#  out_of_stock :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Product < ActiveRecord::Base
  validates :name,
            :description,
            :out_of_stock,
             presence: true

  has_and_belongs_to_many :categories

  has_many :order_items
end
