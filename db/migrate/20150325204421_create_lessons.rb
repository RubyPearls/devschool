class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
    	t.string :name
    	t.string :content
    	t.references :section

    	t.timestamps null: false 
    end
  end
end
