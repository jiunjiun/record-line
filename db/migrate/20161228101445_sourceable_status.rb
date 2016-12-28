class SourceableStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :status, :integer, default: 0

    add_column :rooms, :status, :integer, default: 0

    add_column :users, :status, :integer, default: 0
  end
end
