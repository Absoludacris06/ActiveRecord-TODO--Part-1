
class Task < ActiveRecord::Base
  validates :description, uniqueness: true
end
