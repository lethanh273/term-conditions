class CreateTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :templates do |t|
      t.integer :clause_id
      t.integer :section_id
      t.string :content

      t.timestamps
    end
  end
end
