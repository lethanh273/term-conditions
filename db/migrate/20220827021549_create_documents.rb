class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.integer :template_id
      t.string :body

      t.timestamps
    end
  end
end
