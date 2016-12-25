class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :sourceable, polymorphic: true
      t.references :templatable, polymorphic: true

      t.timestamps
    end
  end
end
