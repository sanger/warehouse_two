# Overrides the broken behaviour of the RailsSqlViews code so that it can handle more
# complicated view definitions.  Basically, the gem assumes a straight SELECT statement,
# but it can be written more complicated than that.  So this changes the behaviour to
# look for the view name and use that.
require 'rails_sql_views/connection_adapters/mysql2_adapter'

module RailsSqlViews
  module ConnectionAdapters
    module Mysql2Adapter
      def view_select_statement(view, name=nil)
        begin
          row = execute("SHOW CREATE VIEW #{view}", name).each do |row|
            return convert_statement(view, row[1]) if row[0] == view
          end
        rescue ActiveRecord::StatementInvalid => e
          raise "No view called #{view} found"
        end
      end

      def convert_statement(name, s)
        s.gsub!(/.*`#{name}` AS (.+)/, '\1')
      end
      private :convert_statement
    end
  end
end

