class CreateAlcohols < ActiveRecord::Migration[5.1]
  def change
    create_table :alcohols do |t|
      t.string :name
      t.float :vv

      t.timestamps
    end
  end
end
