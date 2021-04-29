module Web
  module Views
    module Books
      class Show
        include Web::View

        def page_title
          "#{TITLE} | Book info"
        end
      end
    end
  end
end
