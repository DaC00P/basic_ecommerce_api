# == Schema Information
#
# Table name: customers
#
#  id                     :integer          not null, primary key
#  customer_first_name    :string           not null
#  customer_last_name     :string           not null
#  customer_email_address :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  username               :text             not null
#

require "rails_helper"
require "validates_email_format_of/rspec_matcher"

FactoryGirl.define do
  factory :customer do
    customer_first_name "Garfield"
    customer_last_name "The Cat"
    customer_email_address "garfield@cat.com"
    username "GarfieldTheCat"
  end
end

RSpec.describe "Customer" do
  subject { FactoryGirl.build(:customer) }

  describe "validates the presence of a first name" do
    it { should validate_presence_of(:customer_first_name) }
  end

  describe "validates the presence of a last name" do
    it { should validate_presence_of(:customer_last_name) }
  end

  describe "validates the presence of an email address" do
    it { should validate_presence_of(:customer_email_address) }
    it { should validate_email_format_of(:customer_email_address).with_message('email has invalid format') }
  end

  describe "validates the presence of a username" do
    it { should validate_presence_of(:customer_first_name) }
  end

  describe "has many orders" do
    it {should have_many(:orders)}
  end
end
