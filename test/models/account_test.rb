# == Schema Information
#
# Table name: accounts
#
#  id                  :bigint           not null, primary key
#  account_type        :string
#  company_name        :string
#  is_active           :boolean
#  is_verified         :boolean
#  slug                :string
#  trial_end_warning   :date
#  trial_ends          :date
#  verification_status :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  owner_id            :integer
#
# Indexes
#
#  index_accounts_on_slug  (slug) UNIQUE
#
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
