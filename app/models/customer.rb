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

class Customer < ActiveRecord::Base
  validates :customer_first_name,
            :customer_last_name,
            :customer_email_address,
            :username,
            :presence => true

  validates :customer_email_address,
             uniqueness: true,
             email_format: { message: 'email has invalid format' }

  has_many :orders


end
