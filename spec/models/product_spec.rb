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
#  category_id  :integer          not null
#

require "rails_helper"

FactoryGirl.define do
  factory :product do
    name 'cat treat'
    description 'yum yum treat'
    out_of_stock FALSE
    category_id 1
  end
end

RSpec.describe "Product" do
  subject { FactoryGirl.build(:product) }

  describe "validates the presence of a name" do
    it { should validate_presence_of(:name) }
  end

  describe "validates the presence of a description" do
    it { should validate_presence_of(:description) }
  end

  describe "validates the presence of an out_of_stock boolean" do
    it { should validate_presence_of(:out_of_stock) }
  end

  describe "validates the presence of a category ID" do
    it { should validate_presence_of(:category_id) }
  end

  describe "has many order items (and thus, orders)" do
    it {should have_many(:order_items)}
  end

  describe "has and belongs to many categories" do
    it {should have_and_belong_to_many(:categories)}
  end
end
