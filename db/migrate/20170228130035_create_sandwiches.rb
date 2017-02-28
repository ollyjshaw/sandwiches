class CreateSandwiches < ActiveRecord::Migration[5.0]
  def change
    create_table :sandwiches do |t|
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
