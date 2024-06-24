class CreateAngerLogEmotions < ActiveRecord::Migration[7.1]
  def change
    create_table :anger_log_emotions do |t|
      t.references :anger_log, null: false, foreign_key: true
      t.references :emotion, null: false, foreign_key: true

      t.timestamps
    end
    add_index :anger_log_emotions, [:anger_log_id, :emotion_id], unique: true
  end
end
