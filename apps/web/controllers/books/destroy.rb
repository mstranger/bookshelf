module Web
  module Controllers
    module Books
      class Destroy
        include Web::Action

        def call(params)
          repository = BookRepository.new
          book = repository.find(params[:id])
          return self.status = 422 unless book

          repository.delete(book.id)
          flash[:notice] = 'Book was deleted.'
          redirect_to routes.books_path
        end
      end
    end
  end
end
