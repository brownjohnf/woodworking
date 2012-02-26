class Wood < ActiveRecord::Base
  
  acts_as_taggable
  
  validates :name, :presence => :required
  
end
