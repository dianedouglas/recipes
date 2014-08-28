class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.column :rating, :int
      t.column :recipe_id, :int
    end
  end
end
