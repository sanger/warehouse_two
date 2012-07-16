class RegenerateTriggersToRemoveDeadlocks < ActiveRecord::Migration
  include ResourceTools::ResourceTableMigration

  def up
    each_resource_table do |name|
      maintain_currency_triggers(name)
    end
  end

  def down
    # Nothing to do here as we're not really affecting the behaviour
  end
end
