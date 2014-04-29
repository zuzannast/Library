require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "should not save category without name" do 
		cat = Category.new 
		assert !cat.save, "Saved the category without a name" 
	end
	
  test "shoudl have name with letters only" do
	    cat2= Category.new(:name => '5Name55') 
	    assert !cat2.save, "Saved category without validated name"
    end

  test 'should have unique name' do
    cat1 = Category.create(:name => 'Ruby')
    assert cat1.valid?, "cat1 was not valid #{cat1.errors.inspect}"
    
    cat2 = Category.new(:name => cat1.name)
    cat2.valid?
    assert_not_nil cat2.errors.on(:name)
  end
  
end
