class AddPhotosToHatches < ActiveRecord::Migration[5.1]
  def change
    add_column :hatches, :photos, :string
  end
end
