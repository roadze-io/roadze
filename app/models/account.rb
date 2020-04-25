class Account < ApplicationRecord
  extend FriendlyId
  friendly_id :company_name, use: :slugged
end
