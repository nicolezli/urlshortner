class CreateUrlMaps < ActiveRecord::Migration
  def change
    create_table :url_maps do |t|
      t.string :origin_url, :null => false
      t.string :token, :null => false

      t.timestamps
    end

    add_index :url_maps, :token, unique: true
  end
end
