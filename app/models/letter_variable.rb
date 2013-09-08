class LetterVariable < ActiveRecord::Base
  scope :certificate_variables, -> {where(:is_certificate => true)}
  scope :letter_variables, -> {where(:is_certificate => false)}
end
