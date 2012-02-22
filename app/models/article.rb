class Article < ActiveRecord::Base
  
  has_many :revisions, :as => :revisable, :dependent => :destroy
  
  acts_as_taggable
  
  accepts_nested_attributes_for :revisions
  
end
