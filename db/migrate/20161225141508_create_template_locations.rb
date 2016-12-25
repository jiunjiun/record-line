class CreateTemplateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :template_locations do |t|
      t.string :message_id
      t.string :title
      t.string :address
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
