class SwitchUserTableUuidsToBinary16 < ActiveRecord::Migration
  TABLES = [ :project, :study ]

  def up
    TABLES.each do |name|
      change_table("#{name}_users") do |t|
        t.change("#{name}_uuid", :binary, :limit => 16, :null => false)
      end
    end
  end

  def down
    # Do nothing here, this was a proper mistake!
  end
end
