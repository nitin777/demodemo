class Plot < ActiveRecord::Base
  validates :plot_name, :presence => true
  include SearchHandler  
end
