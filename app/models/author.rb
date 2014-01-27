class Author < ActiveRecord::Base
  has_many :books 
  def full_name
     "#{self.first_name} #{self.last_name}"
  end
    
ransacker :full_name do |parent|
  Arel::Nodes::InfixOperation.new('||',
  Arel::Nodes::InfixOperation.new('||', parent.table[:first_name], ' '),
  parent.table[:last_name])
end

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :last_name, uniqueness: { scope: :first_name }
	validates :first_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
	validates :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

end
