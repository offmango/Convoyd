class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :convoyd_files, :dependent => :destroy
  
    
end
