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
class Account < ApplicationRecord
  extend FriendlyId
  friendly_id :company_name, use: :slugged

  enum verification_status: { awaiting_information: 0, files_submitted: 1, in_progress: 2, approved: 3, not_approved: 4 }

  has_one :owner, class_name: 'User'
  accepts_nested_attributes_for :owner

  has_many :users

  before_validation :set_trial, :set_verification_status, :downcase_company_name

  validates_presence_of :company_name

  validates :account_type, inclusion: { in: %w[owner_operator broker_shipper carrier broker_only], message: "%{value} is not a valid account type" }

  private

  def set_trial
    self.trial_ends = 30.days.from_now
    self.trial_end_warning = 25.days.from_now
    self.is_active = true
  end

  def set_verification_status
    self.verification_status = 0
    self.is_verified = false
  end

  def downcase_company_name
    self.company_name = company_name.try(:downcase)
  end
end
