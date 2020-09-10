class CreateContactPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_people do |t|
      t.string :name,null:false
      t.string :description
      t.references :beforepost, foreign_key: true
      t.timestamps
    end
  end
end
