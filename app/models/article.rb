class Article < ActiveRecord::Base
  
  has_many :revisions, :as => :revisable, :dependent => :destroy
  has_many :users, :through => :revisions
  
  accepts_nested_attributes_for :revisions
  
  validates :title, :presence => true
  
end
