module Web
  module Views
    module Users
      class Index
        include Web::View

        def page_title
          "#{TITLE} | Users"
        end
      end
    end
  end
end
