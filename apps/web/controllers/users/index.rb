module Web
  module Controllers
    module Users
      class Index
        include Web::Action

        expose :users

        def call(_params)
          @users = UserRepository.new.all
        end
      end
    end
  end
end
