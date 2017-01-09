class AddDefaultOneHitsToRead < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reads, :hits, 1
  end
end
