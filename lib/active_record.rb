require "connection_adapter"

module ActiveRecord
    class Base
        @@connection = SqliteAdapter.new

        def initialize(attributes={})
            @attributes = attributes
        end

        def method_missing(name, *args)
            columns = @@connection.columns("users")
            if columns.include?(name)
                @attributes[name]
            else
                super
            end
        end


        def self.find(id)
            attributes = @@connection.execute("SELECT * FROM users WHERE id = #{id.to_i} LIMIT 1").first
            #self.new attributes
            new attributes
        end
    end
end
