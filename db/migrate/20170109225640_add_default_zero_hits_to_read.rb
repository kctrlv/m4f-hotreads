class AddDefaultZeroHitsToRead < ActiveRecord::Migration[5.0]
  def change
    change_column_default :reads, :hits, 0
  end
end
