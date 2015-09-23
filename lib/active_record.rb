require "connection_adapter"

module ActiveRecord
    class Base
        @@connection = SqliteAdapter.new

        def initialize(attributes={})
            @attributes = attributes
        end

        def method_missing(name, *args)
            columns = @@connection.columns(self.class.table_name)
            if columns.include?(name)
                @attributes[name]
            else
                super
            end
        end


        def self.find(id)
            attributes = @@connection.execute("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
            #self.new attributes
            new attributes
        end

        def self.table_name
            name.downcase + "s" # => "users"
        end
    end
end
