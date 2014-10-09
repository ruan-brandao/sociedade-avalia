class CreatePoliticalParties < ActiveRecord::Migration
  def change
    create_table :political_parties do |t|
      t.string :name
      t.string :siglum
      t.decimal :number
      t.string :position

      t.timestamps
    end
  end
end
