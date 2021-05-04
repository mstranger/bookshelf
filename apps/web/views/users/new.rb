module Web
  module Views
    module Users
      class New
        include Web::View

        def page_title
          "#{TITLE} | New user"
        end
      end
    end
  end
end
