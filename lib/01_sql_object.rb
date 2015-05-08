require 'byebug'

require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.



class SQLObject
  def self.columns
    table_columns = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}

    SQL
    @attributes = {}
    column_names = table_columns.first.keys
    column_names.map! do |col_name|
      col_name.to_sym
    end
  end

  def self.finalize!
    columns.each do |col_name|
      define_method("#{col_name}"){ attributes[col_name.to_sym]}
      define_method("#{col_name}="){ |val| attributes[col_name.to_sym] = val}
    end
  end

  def self.table_name=(table_name)
    @table_name ||= table_name
  end

  def self.table_name
    # ...
    @table_name ||= self.to_s.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...

  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end

end
