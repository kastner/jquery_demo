class BooksController < ApplicationController
  before_filter :get_book, :only => %w|show edit update destroy|
  before_filter :get_authors, :only => %w|new edit create|
  before_filter :fetch_author_from_params, :only => %w|create update|
  
  # GET /books
  def index
    @books = Book.find(:all)
  end

  # GET /books/1
  def show
    # @book populated via the before_filter
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    # @book populated via the before_filter
  end

  # POST /books
  def create
    @book = Book.new(params[:book])    
    @book.author = @author
      
    if (@book.save)
      flash[:notice] = 'Book was successfully created.'
      redirect_to(@book)
    else
      render :action => "new"
    end
  end

  # PUT /books/1
  def update
    params[:book].merge!({"author" => @author})
    if @book.update_attributes(params[:book])
      flash[:notice] = 'Book was successfully updated.'
      redirect_to(@book)
    else
      render :action => "edit"
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
    redirect_to(books_url)
  end

private

  def get_book
    @book = Book.find(params[:id])
  end
  
  def get_authors
    @authors = Author.find(:all)
    if (!@author)
      flash[:notice] = "I don't know the author '#{params[:author]}'"
      render :action => "new" && return
    end
  end
  
  def fetch_author_from_params
    @author = Author.find_by_name(params[:author])
  end
end
