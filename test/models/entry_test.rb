require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "should not save entry without name and comment" do 
		entry = Entry.new 
		assert !entry.save, "Saved the entry without a name and comment" 
	end
end
