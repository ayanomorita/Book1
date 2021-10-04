class BooksController < ApplicationController
  def index
    @book = Book.new
    @books =Book.all
  end

  def show
     @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params) #仮に空白、不正な値だったら、false
    if @book.save
     redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
       @books =Book.all
      render :index
      #redirect_to books_path
    end
  end

  #redirect_toとrenderの違い
  #redirect_toは、controllerを切り替えてから、viewを遷移、リロードさせる
  #renderは、controllerを切り替えずにviewを遷移させる
  #だから、renderを使う時は、遷移先のviewに繋がるアクションの変数が必要。

  def edit
     @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path, notice: 'Book was successfully updated.'
    else
      render :edit

    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroy
    .'
  end

 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
