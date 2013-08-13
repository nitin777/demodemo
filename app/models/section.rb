class Section < ActiveRecord::Base
  validates :section_name, :presence => true
  include SearchHandler  
end
