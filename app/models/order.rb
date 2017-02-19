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

  has_many :products,
            through: :order_items

  #FIXME && TODO write 3 SQL queries, one for each day/week/month period,
  #run as an activerecord scope that takes a date range
  #and gets all the products sold by quantity per day/week/month
  #use includes here for eager loading to avoid many DB queries
  scope :products_per_timeperiod, -> (time_option) do
    Orders.includes(:order_items)
          .includes(:products)
          .where(:created_at => @date_range[0]..@date_range[1])
          .group("product(name)")
          .group("CONVERT(orders(date), GETDATE())")
          .map! do |order|
            {products: order.products,
             quantity: order_item.product_quantity,
             time_period: time_option
            }
           end
  end
end
