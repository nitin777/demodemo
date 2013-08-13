class Row < ActiveRecord::Base
  validates :row_name, :presence => true
  include SearchHandler  
end
