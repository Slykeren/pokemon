class CreatePokemen < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemen do |t|
      t.string :name
      t.string :type1
      t.string :type2
      t.integer :total
      t.string :generation

      t.timestamps
    end
  end
end
