class Facility < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :user
  validates :surname, :presence => true
  validates :first_name, :presence => true
  scope :finalized, -> {where(:is_finalized => true)}
  has_many :payments, :as => :paymentable, :dependent => :destroy  
  include SearchHandler
  def name
    self.title + " " + self.surname + " " + self.first_name
  end     
end
