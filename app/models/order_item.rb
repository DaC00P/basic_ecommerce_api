# == Schema Information
#
# Table name: order_items
#
#  id               :integer          not null, primary key
#  order_id         :integer          not null
#  product_id       :integer          not null
#  product_quantity :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class OrderItem < ActiveRecord::Base
  validates :order_id,
            :product_id,
            :product_quantity,
             presence: true

  belongs_to :order

  belongs_to :product
end
