module Web
  module Controllers
    module Books
      class Update
        include Web::Action

        expose :book

        params do
          required(:id) { int? }

          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
            required(:user_id).filled(:int?)
          end
        end

        def call(params)
          @book = BookRepository.new.find(params[:id])
          return self.status = 404 unless @book

          if params.valid?
            BookRepository.new.update(params[:id], params[:book])

            flash[:notice] = 'Book was updated.'
            redirect_to routes.books_path
          else
            @book = Book.new(params[:book].merge(id: @book.id)) # save form field data
            self.status = 422
          end
        end
      end
    end
  end
end
