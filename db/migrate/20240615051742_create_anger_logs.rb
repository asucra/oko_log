class CreateAngerLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :anger_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :occurrence_at, null: false
      t.string :place, null: false
      t.text :event, null: false
      t.text :thought, null: false
      t.integer :anger_level, null: false
      t.text :review
      

      t.timestamps
    end
  end
end
