class CreateElements < ActiveRecord::Migration[5.1]
  def change
    create_table :elements do |t|
      t.string :element_type
      t.string :content

      t.timestamps
    end
  end
end
