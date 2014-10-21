module API
  class V1Controller < ApplicationController
      def index
        redirect_to 'https://github.com/torreta/CourierAppAPI/blob/master/README.md'
      end
  end
end