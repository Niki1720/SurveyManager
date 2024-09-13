class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :height
      t.string :gender
      t.string :favorite_color

      t.timestamps
    end
  end
end
