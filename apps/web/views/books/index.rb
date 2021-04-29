module Web
  module Views
    module Books
      class Index
        include Web::View

        def page_title
          "#{TITLE} | All books"
        end
      end
    end
  end
end
