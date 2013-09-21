class DocumentShare < ActiveRecord::Base
  belongs_to :user
  belongs_to :folder
  validates :user_id, :presence => true
  #validates_uniqueness_of :user_id
end
