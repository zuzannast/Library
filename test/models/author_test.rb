require 'test_helper'

class AuthorTest < ActiveSupport::TestCase

test "should not save author without first and last name" do 
		author = Author.new 
		assert !author.save, "Saved the author without a first and last name" 
	end

test "shoudl have name with letters only" do
	a1= Author.new 
	a1.first_name = 'Name55'
	assert !a1.save, "Saved author without validated name"
    end

test "shoudl have surname with letters only" do
	a2= Author.new(:last_name => '5Name55') 
	assert !a2.save, "Saved author without validated surname"
    end

end

