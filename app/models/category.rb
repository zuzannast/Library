class Category < ActiveRecord::Base
	has_and_belongs_to_many :books, join_table: :books_categories

	validates :name, :presence => true
	validates :name, :uniqueness => true
	validates :name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

end
