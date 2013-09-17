class RolePermission < ActiveRecord::Base
  belongs_to :cemetery
  belongs_to :role
end
