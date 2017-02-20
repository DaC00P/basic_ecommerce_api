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
  #After this functions, refactor it so that there is *one* scope, with a call to a helper method
  #that decides passed on an arguement which of the three (month/day/year) helper methods should be called.
  #this helper method to the helper method of the scope will run the query via find_by_sql() call.

  scope :products_per_day, -> (date_range) do
    sql_query = <<-SQL
      SELECT order.products, order_item.product_quantity, COUNT(the number of order items divided by number days) AS products_per_day
      FROM orders JOIN order_items ON orders.id = order_items.order_id
      JOIN products ON order_items.product_id = product.id
      WHERE #{sanitized_date_range}
      GROUP BY order_items.created_at::timestamp::date;
    SQL
    Product.where(sql_query)
  end

  scope :products_per_month, -> (date_range) do
    sql_query = <<-SQL
      SELECT order.products, order_item.product_quantity, COUNT(the number of order items divided by number months) AS products_per_month
      FROM orders JOIN order_items ON orders.id = order_items.order_id
      JOIN products ON order_items.product_id = product.id
      WHERE #{sanitized_date_range}
      GROUP BY order_items.created_at::timestamp::date;
    SQL
    Product.where(sql_query)
  end

  scope :products_per_year, -> (date_range) do
    sql_query = <<-SQL
      SELECT order.products, order_item.product_quantity, COUNT(the number of order items divided by number years) AS products_per_year
      FROM orders JOIN order_items ON orders.id = order_items.order_id
      JOIN products ON order_items.product_id = product.id
      WHERE #{sanitized_date_range}
      GROUP BY order_items.created_at::timestamp::date;
    SQL
    Product.where(sql_query)
  end

  protected

  def sanitized_date_range(date_range)
    sanitize_sql(["order_items.created_at BETWEEN ? and ?", date_range[0], date_range[1]])
  end

end
