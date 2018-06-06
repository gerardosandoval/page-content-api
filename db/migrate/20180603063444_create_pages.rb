class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
