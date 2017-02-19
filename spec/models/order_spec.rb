# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  customer_id  :integer          not null
#  number_items :integer
#  order_status :text
#

require "rails_helper"

FactoryGirl.define do
  factory :order do
    customer_id 1
    number_items 12
  end
end

RSpec.describe "Product" do
  subject { FactoryGirl.build(:order) }

  describe "validates the presence of a customer id" do
    it { should validate_presence_of(:customer_id) }
  end

  describe "validates the presence of number of items" do
    it {should validate_presence_of(:number_items)}
  end

  describe "validates the presence of order status" do
    it {should validate_presence_of(:order_status)}
  end

  describe "should belong to a customer" do
    it {should belong_to(:customer)}
  end

  describe "should have many order items" do
    it {should have_many(:order_items)}
  end

  describe "should have many products" do
    it {should have_many(:products)}
  end
end
