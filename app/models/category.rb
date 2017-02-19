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

  #TODO Does this need to use heredocs? I think the ? interpolation method should work in the query but make sure
  query = File.read(Rails.root.join('app', 'controllers', 'static', 'categories_purchased_per_customer_query.sql'))

  scope :categories_purchased_per_customer, -> (customer_id) do
    Category.find_by_sql [query, customer_id]
  end
end
