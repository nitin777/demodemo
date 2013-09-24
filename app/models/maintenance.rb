class Maintenance < ActiveRecord::Base
  belongs_to :user
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grafe  
  belongs_to :maintenance_company
  
  include SearchHandler
end
