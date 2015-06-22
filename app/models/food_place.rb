class FoodPlace < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	searchkick
	# paginates_per 4
	# max_paginates_per 4

	belongs_to :user
	has_many :reviews
	validates :name, :address, :phone, :website, :image, presence: true
	validates :about, presence: true, length: { minimum: 25 }
	validates :phone, format: { with: /\A\(\d{3}\) \d{3}-\d{4}\z/,
    message: "number must be in this format (123) 456-7890" }
    validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
    message: "must start with http:// or http://" }
    validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
    message: "must be in the format: 706 Congress Avenue, Austin, TX 78701" }

end
