class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.integer :born
      t.integer :died
      t.text :info

      t.timestamps
    end
  end
end
