class Grantee < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :denomination
  has_many :grantee_graves, :dependent => :destroy
  has_many :permits
  has_many :grave_histories, :dependent => :destroy
  validates :first_name, :presence => true
  validates :surname, :presence => true
  has_many :bookings
  include SearchHandler
  
  def name
    self.title + " " + self.surname + " " + self.first_name
  end  
end
