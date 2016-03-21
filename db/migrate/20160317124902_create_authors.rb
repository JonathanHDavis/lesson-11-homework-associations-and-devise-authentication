class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :string

      t.timestamps null: false
    end
  end
end
