class CreateTemplateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :template_images do |t|
      t.string :message_id

      t.timestamps
    end
  end
end
