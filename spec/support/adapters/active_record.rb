require 'active_record'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'json_attributes_database')

load File.dirname(__FILE__) + '/../schema.rb'

require 'json_attributes'

ActiveRecord::Base.send :extend, JsonAttributes

class User < ActiveRecord::Base
  # include JsonAttributes
  json_attributes :office, :address
end
