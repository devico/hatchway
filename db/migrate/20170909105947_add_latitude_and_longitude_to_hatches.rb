class AddLatitudeAndLongitudeToHatches < ActiveRecord::Migration[5.1]
  def change
    add_column :hatches, :latitude, :float
    add_column :hatches, :longitude, :float
  end
end
