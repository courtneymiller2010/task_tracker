class Project < ActiveRecord::Base
  has_many :deliverables
  has_many :tasks
end
