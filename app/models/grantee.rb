class Grantee < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :denomination
  has_many :grantee_graves, :dependent => :destroy
  validates :first_name, :presence => true
  validates :surname, :presence => true
  include SearchHandler  
end
