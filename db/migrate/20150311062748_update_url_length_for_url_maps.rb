class UpdateUrlLengthForUrlMaps < ActiveRecord::Migration
  def change
  	change_column :url_maps, :origin_url, :string, :limit => 2083
  end
end
