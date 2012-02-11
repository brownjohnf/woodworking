class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  has_and_belongs_to_many :roles
  
  validates :name, :email, :presence => true
  
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
  
  private
  
    def add_user_role
      self.roles << Role.find_by_name('User')
    end

end
