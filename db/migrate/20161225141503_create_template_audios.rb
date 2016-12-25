class CreateTemplateAudios < ActiveRecord::Migration[5.0]
  def change
    create_table :template_audios do |t|
      t.string :message_id

      t.timestamps
    end
  end
end
