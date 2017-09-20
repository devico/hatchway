class AddAddressToHatches < ActiveRecord::Migration[5.1]
  def change
    add_column :hatches, :address, :string
  end
end
