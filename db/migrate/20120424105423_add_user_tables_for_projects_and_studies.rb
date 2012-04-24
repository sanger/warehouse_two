class AddUserTablesForProjectsAndStudies < ActiveRecord::Migration
  TABLES = [ :project, :study ]

  def up
    TABLES.each do |name|
      create_table("#{name}_users") do |t|
        t.column("#{name}_internal_id", :integer, :null => false)
        t.column("#{name}_uuid", :integer, :null => false)
        t.column(:role, :string, :null => false)
        t.column(:login, :string, :null => false)
        t.column(:email, :string)
        t.column(:name, :string)
      end
    end
  end

  def down
    TABLES.each do |name|
      drop_table("#{name}_users")
    end
  end
end
