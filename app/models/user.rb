class User < ActiveRecord::Base
  rolify
  authenticates_with_sorcery!
  
  attr_accessible :email, :password, :password_confirmation, :username

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :username
  validates_uniqueness_of :username

  def self.search(search)
  	where('username like ?  ', "%#{search}%" )
  end

end
