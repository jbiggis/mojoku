class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :username, :gender, :DOB, :role, :phone, :facebook, :twitter

has_one :model, :dependent => :destroy
has_one :photographer, :dependent => :destroy
has_one :modeling_agent, :dependent => :destroy
has_many :albums, :dependent => :destroy
has_many :album_images, :through => :albums

validates :first_name, :presence => true
validates :last_name, :presence => true
validates :gender, :presence => true
validates :DOB, :presence => true
validates :role, :presence => true

accepts_nested_attributes_for :model
accepts_nested_attributes_for :photographer
accepts_nested_attributes_for :modeling_agent


end
