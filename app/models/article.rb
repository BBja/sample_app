class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
	                    length: { minimum: 5, maximum: 10 }

	def self.search(search)
		if search
			where("title LIKE '%#{search}%'")
		else
			find_each
		end
	end
end
