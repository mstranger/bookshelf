module Web
  module Views
    module Books
      class New
        include Web::View

        def page_title
          "#{TITLE} | New book"
        end
      end
    end
  end
end
