# == Schema Information
#
# Table name: categories
#
#  id                   :integer          not null, primary key
#  category_description :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require "rails_helper"

FactoryGirl.define do
  factory :category do
    category_description "toy"
  end
end

RSpec.describe "Category" do
  subject { FactoryGirl.build(:category) }

  describe "validates the presence of a description" do
    it { should validate_presence_of(:category_description) }
  end

  describe "belongs to many products" do
    it {should have_and_belong_to_many(:products)}
  end
end
