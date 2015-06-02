class User < ActiveRecord::Base
	has_many :chirps, dependent: :destroy
	validates :password, confirmation: true
	validates_uniqueness_of :username, :email
	validates_presence_of :username, :email, :password, :lname, :fname, :password_confirmation
	validates :password, presence: true, on: :create
	validates :password_confirmation, presence: true, on: :create

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end




