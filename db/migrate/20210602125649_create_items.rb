class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :done, default: false
      t.references :todo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
