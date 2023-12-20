class AddColumnToPlants < ActiveRecord::Migration[7.1]
  def change
    add_column :plants, :name, :string
    add_column :plants, :image_url, :string
  end
end
