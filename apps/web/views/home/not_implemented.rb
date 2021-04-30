module Web
  module Views
    module Home
      class NotImplemented
        include Web::View

        def page_title
          "#{TITLE} | Not Implemented"
        end
      end
    end
  end
end
