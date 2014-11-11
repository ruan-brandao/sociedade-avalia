class AddAttachmentPictureToPoliticalParties < ActiveRecord::Migration
  def self.up
    change_table :political_parties do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :political_parties, :picture
  end
end
