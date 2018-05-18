class CreateTeaminvites < ActiveRecord::Migration[5.1]
  def change
    create_table :teaminvites do |t|
      t.bigint :organization_id
      t.string :email
      t.boolean :accepted
      t.boolean :admin
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
