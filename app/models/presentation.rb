class Presentation < ActiveRecord::Base
  # VALIDATIONS
  validates :name, :uniqueness => true
end
