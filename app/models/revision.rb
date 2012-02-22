class Revision < ActiveRecord::Base
  
  belongs_to :revisable, :polymorphic => true
  belongs_to :user
  
end
