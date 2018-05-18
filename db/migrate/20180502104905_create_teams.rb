class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
