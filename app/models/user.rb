class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role_ids
  
  has_and_belongs_to_many :roles
  
  accepts_nested_attributes_for :roles, :allow_destroy => true
  validates :name, :email, :presence => true

  has_many :relationships, :foreign_key => 'follower_id', :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed

  has_many :reverse_relationships, :foreign_key => 'followed_id', :class_name => 'Relationship', :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  
  after_create :add_user_role
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      User.create!(:name => "#{data.first_name} #{data.last_name}", :email => data.email, :password => Devise.friendly_token[0,20])
    end
  end
  
  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  private
  
    def add_user_role
      self.roles << Role.find_by_name('User')
    end

end
