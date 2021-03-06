module Web
  module Controllers
    module Books
      class Create
        include Web::Action

        expose :book

        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
            required(:user_id).filled(:int?)
          end
        end

        def call(params)
          if params.valid?
            BookRepository.new.create(params[:book])

            flash[:notice] = 'New book was added.'
            redirect_to routes.books_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
