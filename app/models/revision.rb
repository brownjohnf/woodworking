class Revision < ActiveRecord::Base
  
  belongs_to :revisable, :polymorphic => true, :touch => true
  belongs_to :article, :foreign_key => :revisable_id
  
  belongs_to :user
  
  acts_as_taggable
  
  accepts_nested_attributes_for :article
  
  validates :content, :presence => true
  
end
