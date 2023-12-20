class CreatePlants < ActiveRecord::Migration[7.1]
  def change
    create_table :plants do |t|
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
