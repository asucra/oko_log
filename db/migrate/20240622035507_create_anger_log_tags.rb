class CreateAngerLogTags < ActiveRecord::Migration[7.1]
  def change
    create_table :anger_log_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :anger_log, null: false, foreign_key: true

      t.timestamps
    end
    add_index :anger_log_tags, [:tag_id, :anger_log_id], unique: true
  end
end
