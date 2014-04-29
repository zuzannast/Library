class Book < ActiveRecord::Base
	belongs_to :author
	has_and_belongs_to_many :categories, join_table: :books_categories
	has_one :reservation

	validates :title, :presence => true
end
