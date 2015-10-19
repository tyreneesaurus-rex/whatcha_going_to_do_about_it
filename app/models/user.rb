class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, length: { :in => 3..20 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates_length_of :password, :in => 6..20, :on => :create
  has_many :tasks


end
