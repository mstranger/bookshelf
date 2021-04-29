module Web
  module Views
    module Books
      class Edit
        include Web::View

        def page_title
          "#{TITLE} | Edit book"
        end
      end
    end
  end
end
