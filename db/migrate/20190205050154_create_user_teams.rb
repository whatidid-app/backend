class CreateUserTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_teams do |t|
      t.integer :team_id
      t.integer :user_id
      t.timestamps
    end

    add_column :user_teams, :deleted_at, :datetime
    add_index :user_teams, :deleted_at
    add_index :user_teams, [:team_id, :user_id], unique: true
  end
end
