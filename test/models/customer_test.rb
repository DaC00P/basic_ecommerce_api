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

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
