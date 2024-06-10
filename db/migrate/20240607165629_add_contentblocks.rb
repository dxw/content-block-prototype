class AddContentblocks < ActiveRecord::Migration[7.0]
  def change
    create_table :content_blocks do |t|
      t.string :block_type
      t.jsonb :properties
      t.timestamps
    end
  end
end
