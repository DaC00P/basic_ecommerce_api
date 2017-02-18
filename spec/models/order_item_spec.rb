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

require "rails_helper"

FactoryGirl.define do
  factory :order_item do
    order_id 1
    product_id 1
    product_quantity 6
  end
end

RSpec.describe "Product" do
  subject { FactoryGirl.build(:order_item) }

  describe "validates the presence of a name" do
    it { should validate_presence_of(:order_id) }
  end

  describe "validates the presence of a description" do
    it { should validate_presence_of(:product_id) }
  end

  describe "validates the presence of an out_of_stock boolean" do
    it { should validate_presence_of(:product_quantity) }
  end

  describe "has many orders" do
    it {should belong_to(:order)}
  end

  describe "has and belongs to many categories" do
    it {should belong_to(:product)}
  end
end
