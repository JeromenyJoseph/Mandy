class CreateChirps < ActiveRecord::Migration
  def change
    create_table :chirps do |t|
      t.text :body
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
  	end  
  	add_foreign_key :chirps, :users
	end
end
   

