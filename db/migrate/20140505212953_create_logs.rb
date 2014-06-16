class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :case_type
      t.string :person
      t.integer :customer_id
      t.text :description
      t.integer :length
      t.integer :followup
      t.text :followup_note
      t.integer :user_id
      t.integer :app_note

      t.timestamps
    end
  end
end
