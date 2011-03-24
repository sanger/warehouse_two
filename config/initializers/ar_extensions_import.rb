# AR extensions doesnt reliably pickup if mysql supports bulk imports, so force it
class ActiveRecord::Base
  class << self
    def import_without_validations_or_callbacks( column_names, array_of_attributes, options={} )
      escaped_column_names = quote_column_names( column_names )
      columns = []
      array_of_attributes.first.each_with_index { |arr,i| columns << columns_hash[ column_names[i] ] }

        # generate the sql
        insert_sql = connection.multiple_value_sets_insert_sql( quoted_table_name, escaped_column_names, options )
        values_sql = connection.values_sql_for_column_names_and_attributes( columns, array_of_attributes )
        post_sql_statements = connection.post_sql_statements( quoted_table_name, options )
        
        # perform the inserts
        number_inserted = connection.insert_many( [ insert_sql, post_sql_statements ].flatten, 
                                                  values_sql,
                                                  "#{self.class.name} Create Many Without Validations Or Callbacks" )
      
      number_inserted
    end
  end
end