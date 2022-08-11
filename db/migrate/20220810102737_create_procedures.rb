class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.text :image
      t.text :content
      t.datetime :date
      t.datetime :deadline
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
