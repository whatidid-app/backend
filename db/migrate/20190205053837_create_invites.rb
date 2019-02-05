class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string   :token, null: false, limit: 16
      t.string   :email, null: false
      t.boolean  :redeemed, null: false, default: false
      t.references :team
      t.timestamps
    end

    add_column :invites, :deleted_at, :datetime
    add_index :invites, :deleted_at
  end
end
