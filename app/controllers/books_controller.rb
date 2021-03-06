class BooksController < ApplicationController
	before_action :find_book, only: [:show,:edit, :update, :destroy]
	def index
		@books = Book.all.order("created_at DESC")
	end
	def new
		@book = current_user.books.build
	end

	def create
		@book = current_user.books.build(book_params)
		if @book.save
			redirect_to root_path
		else render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @book.update(book_params)
			redirect_to book_path
		else render 'edit'
		end
	end

	def destroy
		 @book.delete
			redirect_to root_path
		 render 'show'
		
	end

private

def book_params
	params.require(:book).permit(:title, :desc, :author)

end
def find_book
	@book = Book.find(params[:id])
end

end
