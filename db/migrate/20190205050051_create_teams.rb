class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string   :name, null: false
      t.string   :slug, null: false, limit: 6
      t.integer :status, null: false, default: 0
      t.timestamps
    end

    add_column :teams, :deleted_at, :datetime
    add_index :teams, :deleted_at
    add_index :teams, :slug, unique: true
  end
end
