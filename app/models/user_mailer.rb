class UserMailer < ActionMailer::Base
	def reminder_email(user)
	recipients user.email
	from "Library <admin@library.com>"
	subject "Hey ho!"
	sent on Time.now
		
end
