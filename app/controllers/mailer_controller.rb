class MailerController < ApplicationController
  before_action :set_reservations, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  before_action :set_users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  def index
    User.all.map do |user|
       if user.reservations.nil?
       else
           @user = user
           @reservations_close = Array.new
           @reservations_ended = Array.new
           user.reservations.each do |reservation|
               if reservation.date < Time.now
                   @reservations_ended << reservation
                elsif reservation.date > Time.now and reservation.date < (Time.now + 5.minutes)
                   @reservations_close << reservation
                end
           end
              if @reservations_close.empty? and @reservations_ended.empty?
              else
                UserMailer.reminder(@user, @reservations_close, @reservations_ended).deliver
              end
         end
   end
  end
    
    
    
    
    
    private
    # Use callbacks to share common setup or constraints between actions. Never trust parameters from the scary internet, only allow the white list through.
  
   
    def set_reservations
     @reservations = Reservation.find(:all).map do |reservation|
       [ reservation.book_id ]
     
     end
   end
    	def set_users
	  @users = User.find(:all).map do |user|
	    [ user.id, user.email ]
	  end
	end end
