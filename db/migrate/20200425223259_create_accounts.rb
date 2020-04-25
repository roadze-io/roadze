class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :company_name
      t.integer :owner_id
      t.date :trial_ends
      t.date :trial_end_warning
      t.boolean :is_active
      t.boolean :is_verified
      t.integer :verification_status
      t.string :account_type

      t.timestamps
    end
  end
end
