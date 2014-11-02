class CreatePoliticalPartyLikes < ActiveRecord::Migration
  def change
    create_table :political_party_likes do |t|
      t.integer :user_id
      t.integer :political_party_id
      t.boolean :value

      t.timestamps
    end
  end
end
