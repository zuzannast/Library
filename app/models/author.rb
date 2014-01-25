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
end
