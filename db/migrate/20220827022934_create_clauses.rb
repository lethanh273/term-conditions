class CreateClauses < ActiveRecord::Migration[6.1]
  def change
    create_table :clauses do |t|
      t.string :text
      t.integer :reference_id

      t.timestamps
    end
  end
end
