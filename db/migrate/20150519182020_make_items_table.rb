class MakeItemsTable < ActiveRecord::Migration
  def change
    create_table(:items) do |t|
      t.column(:description, :string)
      t.timestamps
    end
  end
end
