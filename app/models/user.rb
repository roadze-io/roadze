# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  is_owner               :boolean
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  profile_complete       :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  sign_in_count          :integer          default(0), not null
#  slug                   :string
#  unconfirmed_email      :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_id             :integer
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged

  enum role: { owner: 0, super_user: 1 }

  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :confirmable, :trackable, authentication_keys: [:username]

  multi_tenant :account
  belongs_to :account

  before_validation :set_account_owner, :down_case_username

  validates_presence_of :username

  validates :email, uniqueness: false
  validates :username, uniqueness: true

  private

  def will_save_change_to_email?
    false
  end

  def set_account_owner
    return unless role.nil?

    self.role ||= 0
    self.is_owner = true
    self.profile_complete = false
  end

  def down_case_username
    self.username = username.try(:downcase)
  end
end
