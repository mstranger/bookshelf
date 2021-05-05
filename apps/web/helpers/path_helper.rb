module Web
  module Helpers
    module PathHelper
      private

      def current_path
        params.env['REQUEST_PATH']
      end

      def current_path?(path)
        current_path == path
      end
    end
  end
end
