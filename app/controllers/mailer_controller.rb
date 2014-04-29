class MailerController < ApplicationController 

  def reminders
    myArray = Array.new
    x = 0
    @users = User.all.map do |u|
     @reservations = Reservation.all.map do |r|
       if myArray.include?(r.user)
         next
       else
         myArray[x] = r.user
         x=x+1
         
         
         if r.date < Time.now
           UserMailer.reminder( r.user).deliver
         end
         
       end
       
     end
     
   end

 end
end
