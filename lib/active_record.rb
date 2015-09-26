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
            sql  = "SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1"
            #attributes = @@connection.execute("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
            #self.new attributes
            return self.find_by_sql(sql).first
        end

        def self.all
            sql = "SELECT * FROM #{table_name}"
            return self.find_by_sql(sql)
        end

        def self.find_by_sql(sql)
            @@connection.execute(sql).map do |attributes| # [atrributes, attributes]
              new attributes
            end
            # objects = []
            # @@connection.execute(sql).each do |attributes|
            #     objects << (new attributes)
            # end
            # objects
        end

        def self.table_name
            #User.name
            #self.name
            name.downcase + "s" # => "users"
        end
    end
end
