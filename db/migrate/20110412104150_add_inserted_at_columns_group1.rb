class AddInsertedAtColumnsGroup1 < ActiveRecord::Migration
  def self.up
    add_column :asset_links,   :inserted_at, :datetime # big
    add_column :asset_audits,  :inserted_at, :datetime # small
    add_column :projects,      :inserted_at, :datetime # small
    add_column :tag_instances, :inserted_at, :datetime # small
  end

  def self.down
  end
end
