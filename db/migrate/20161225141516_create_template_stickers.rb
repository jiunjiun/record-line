class CreateTemplateStickers < ActiveRecord::Migration[5.0]
  def change
    create_table :template_stickers do |t|
      t.string :message_id
      t.string :package_id
      t.string :sticker_id

      t.timestamps
    end
  end
end
