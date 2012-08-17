  class User < ActiveRecord::Base
	has_many :posts, :dependent => :destroy
  has_mailbox 
  has_many :qmails
  has_many :involvements
  has_many :quests, :through => :involvements, :uniq => true
  acts_as_authentic
    attr_accessible :name, :email, :password, :password_confirmation
end

