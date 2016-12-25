class CreateTemplateTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :template_texts do |t|
      t.string :message_id
      t.string :text

      t.timestamps
    end
  end
end
