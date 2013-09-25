class Payment < ActiveRecord::Base
  belongs_to :paymentable, :polymorphic => true  
  belongs_to :catalog
end
