class SearchController < ApplicationController
  def home
    require 'will_paginate/array'
    q = params[:q]
    @q = params[:q]
    @authors = Author.search(full_name_cont: q).result(distinct: true).paginate(:per_page => 5, :page => params[:page])
    @books   = Book.search(title_cont: q).result(distinct: true).paginate(:per_page => 5, :page => params[:page])
    #@books = @q.result(distinct: true).paginate(:per_page => 10, :page => params[:page])
    #@posts = Post.paginate(:page => params[:page])
    @categories = Category.search(name_cont: q).result(distinct: true).paginate(:per_page => 5, :page => params[:page])
  end
    
  def bold
        
  end
end
