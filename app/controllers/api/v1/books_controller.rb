class Api::V1::BooksController < ApplicationController
  skip_before_action :verify_authenticity_token ,raise: false
  before_action :find_book,only: [:show,:update,:destroy]

  def index
    @books = Book.all
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = current_v1_api_user.books.build(book_params)
    if @book.save
      render json: @book , status: :ok
    else
      render json: @book.errors , status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book,status: :ok
    else
      render json: @book.error,status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    head(:ok)
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.permit(:title,:author,:description)
  end
end
