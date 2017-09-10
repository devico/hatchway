class CreateHatches < ActiveRecord::Migration[5.1]
  def change
    create_table :hatches do |t|
      t.boolean :a
      t.boolean :a1
      t.boolean :b
      t.boolean :c
      t.boolean :d

      t.timestamps
    end
  end
end
