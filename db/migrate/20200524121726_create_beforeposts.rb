class CreateBeforeposts < ActiveRecord::Migration[5.1]
  def change
    create_table :beforeposts do |t|
      t.text :content
      t.text :place
      t.text :remarks
      t.datetime :started_at
      t.datetime :ended_at
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :beforeposts, [:user_id, :created_at]
  end
  
end
