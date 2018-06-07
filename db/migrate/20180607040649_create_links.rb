class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :page, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
