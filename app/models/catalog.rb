class Catalog < ActiveRecord::Base
  has_many :grantee_graves
  validates :name, :presence => true
  include SearchHandler  
end
