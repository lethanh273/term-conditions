class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.text :clause_ids, array: true, default: []
      t.string :content
      t.integer :reference_id
      t.timestamps
    end
  end
end
