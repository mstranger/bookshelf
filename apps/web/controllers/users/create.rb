module Web
  module Controllers
    module Users
      class Create
        include Web::Action

        expose :user

        params do
          required(:user).schema do
            required(:email).filled(:str?)
          end
        end

        def call(params)
          if params.valid?
            UserRepository.new.create(params[:user])

            flash[:notice] = 'User was created.'
            redirect_to routes.users_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
