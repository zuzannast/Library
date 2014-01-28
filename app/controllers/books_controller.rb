class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_authors, only: [:new, :edit, :update, :create]
  before_action :set_categories, only: [:new, :edit, :update, :create]
  before_action :set_reservations, only: [:show, :index, :create, :new, :edit, :update, :destroy ]

  # GET /books
  # GET /books.json
  def index
   require 'will_paginate/array'
   @books = Book.all.sort_by(&:title).paginate(:page => params[:page], :per_page => 5)
   @user = current_user
      @reservation = Reservation.new
  end

  # GET /books/1
  # GET /books/1.json
  def show

      @user = current_user
      if @book.reservation.nil?
          @reservation = Reservation.new 
	end
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.isbn=@isbn
    @book.year=@year
    @book.place=@place
    @book.publisher=@publisher
    

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
  if @book.reservation.nil?
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  else
	respond_to do |format|
            format.html { redirect_to books_url, notice: 'This book is reserved and cannot be deleted.' }
            format.json { head :no_content }
        end 
    end    
end
# Use callbacks to share common setup or constraints between actions.
private
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author_id, :publisher, :year, :place, :isbn, {:category_ids => []})
    end

	def set_authors
		@authors = Author.find(:all).map do |author|
			[ author.full_name, author.id]
	  end 
	end

	def set_categories
		@categories = Category.find(:all).map do |category|
		  	[ category.name, category.id]
	  end
	end

	def set_reservations
        	  @reservations = Reservation.find(:all).map do |reservation|
      			[ reservation.book_id] 
	end
      
   end
end
