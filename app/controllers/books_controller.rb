class BooksController < ApplicationController
  before_filter :get_book, :only => [:show, :edit, :update, :destroy]
  before_filter :get_authors, :only => [:new, :edit, :create]
  
  # GET /books
  def index
    @books = Book.find(:all)
  end

  # GET /books/1
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  def create
    @book = Book.new(params[:book])
    author = Author.find_by_name(params[:author])
    if (!author)
      flash[:notice] = "I don't know the author '#{params[:author]}'"
      render :action => "new"
    else
      @book.author = author
      @book.save!
      flash[:notice] = 'Book was successfully created.'
      redirect_to(@book)
    end
  end

  # PUT /books/1
  def update
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
  end
end
