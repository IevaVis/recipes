class Cocktail < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :ingredients, presence: true
	validates :preparation, presence: true
	mount_uploader :picture, PictureUploader


	def self.search(search)
  	where("title ILIKE ?",  "%#{search}%" )
  end
  
  def self.non_alcoholic
    where(non_alcoholic: true)
  end

end