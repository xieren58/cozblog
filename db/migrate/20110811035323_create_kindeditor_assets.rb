class CreateKindeditorAssets < ActiveRecord::Migration
  def self.up
    create_table :kindeditor_assets do |t|
      t.string :asset
      t.integer :file_size
      t.string :file_type
      t.timestamps
    end
  end

  def self.down
    drop_table :kindeditor_asset
  end
end

