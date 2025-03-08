class CreateAnimalEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :animal_entries do |t|
      t.string :name
      t.string :scientific_name
      t.string :habitat
      t.text :characteristics

      t.timestamps
    end
  end
end
