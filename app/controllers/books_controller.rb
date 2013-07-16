class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:book])
    @book.user = current_user

    if @book.save
      redirect_to @book, notice: "Book successfully created."
    else
      render action: 'new'
    end
  end

  def index
    if current_user.present?
      @user = current_user.id
      @books = Book.where(user_id: @user)
    else
      @books = []
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(params[:book])
      redirect_to book_path(@book), notice: "Book successfully updated!."
    else
      render action: 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, notice: "Book was successfully deleted!"
  end
end
