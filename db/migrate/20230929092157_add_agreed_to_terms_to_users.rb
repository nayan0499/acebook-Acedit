class AddAgreedToTermsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :agreed_to_terms, :boolean
  end
end
