class Maintenance < ActiveRecord::Base
  belongs_to :user
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grafe  
  
  include SearchHandler
end
