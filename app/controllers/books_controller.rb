class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(post_image_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Your book has been created successfully"
      redirect_to books_path
    else
      flash.now[:notice] = "error: failed to create"
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def post_image_params
    params.require(:book).permit(:title, :body)
  end
end
