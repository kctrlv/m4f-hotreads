class AddReadIdToHit < ActiveRecord::Migration[5.0]
  def change
    add_column :hits, :read_id, :integer
  end
end
