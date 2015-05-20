class CreateEnemyTable < ActiveRecord::Migration
  def change
    create_table(:enemies) do |t|
      t.column(:name, :string)
    end
  end
end
