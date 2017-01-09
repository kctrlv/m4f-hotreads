class CreateHotreads < ActiveRecord::Migration[5.0]
  def change
    create_table :hotreads do |t|
      t.string :url
      t.integer :hits

      t.timestamps
    end
  end
end
