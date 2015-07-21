class User < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	paginates_per 3

	extend FriendlyId
  	friendly_id :username, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  	has_many :reviews, dependent: :destroy
  	has_many :food_places, dependent: :destroy

  	validates :first_name, :last_name, presence: true
  	validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }


    def should_generate_new_friendly_id?
    	new_record?
  	end

end
