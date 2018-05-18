class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :org_name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
