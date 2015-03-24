class AddAttachmentImageToAbouts < ActiveRecord::Migration
  def self.up
    change_table :abouts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :abouts, :image
  end
end
