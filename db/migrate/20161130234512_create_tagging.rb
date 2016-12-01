class CreateTagging < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :topic_id, null: false
      t.integer :shortened_url_id, null: false

      t.timestamps
    end

    add_index :taggings, [:topic_id, :shortened_url_id], unique: true

  end
end
