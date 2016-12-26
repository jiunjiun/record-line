class SourceableCode < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :code, :string
    add_index :groups, :code

    add_column :rooms, :code, :string
    add_index :rooms, :code

    add_column :users, :code, :string
    add_index :users, :code
  end
end
