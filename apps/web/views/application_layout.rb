module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      Web::Views::TITLE = 'Bookshelf'

      def page_title
        TITLE
      end
    end
  end
end
