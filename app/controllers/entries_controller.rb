# encoding: utf-8
class EntriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @entries = Entry.order("created_at DESC")
  end

  def new
    @entry = Entry.new
    @entry.name = current_user.email
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to root_path, notice: 'Thanks you adding your entry!'
      
    else
      render new_entry_path
    end
  end
 
  private 
  def entry_params
    params.require(:entry).permit(:name, :comment)
  end
end
