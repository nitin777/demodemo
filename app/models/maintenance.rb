class Maintenance < ActiveRecord::Base
  belongs_to :user
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot
  belongs_to :grafe  
  belongs_to :maintenance_company
  has_many :payments, :as => :paymentable, :dependent => :destroy
  include SearchHandler
  
  def name
    self.interred_name + " " + self.interred_surname
  end
  
end
