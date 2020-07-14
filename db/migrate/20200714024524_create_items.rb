class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :japanese
      t.string :english
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
