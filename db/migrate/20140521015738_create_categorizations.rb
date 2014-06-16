class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :log_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
