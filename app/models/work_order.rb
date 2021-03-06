class WorkOrder < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :area
  belongs_to :section
  belongs_to :row
  belongs_to :plot  
  belongs_to :grafe  
  
  belongs_to :delegation_department
  belongs_to :work_type
  belongs_to :catalog
  has_many :payments, :as => :paymentable, :dependent => :destroy
  #validates :first_name, :surname, :presence => true
  
  belongs_to :completed_by, class_name: "User", foreign_key: :completed_user_id
  belongs_to :requested_by, class_name: "User", foreign_key: :requested_user_id
  belongs_to :approved_by, class_name: "User", foreign_key: :approved_user_id
  include SearchHandler
  
  def name
    self.title + " " + self.surname + " " + self.first_name
  end  
        
end
