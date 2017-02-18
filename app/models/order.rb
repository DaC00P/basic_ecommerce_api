# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  customer_id  :integer          not null
#  number_items :integer
#  order_status :text
#

class Order < ActiveRecord::Base
  validates :customer_id,
            :number_items,
            :order_status,
            presence: true

  belongs_to :customer

  has_many :order_items
end
