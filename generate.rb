module Xmlrpc2Html
  class Generate
    def initialize(app)
      raise ArgumentError "app must be Xmlrpc2Html::Setup" unless app.is_a?(Xmlrpc2Html::Setup)
      
      get '/' do
        return layout(app, app.inspect)
      end

      return 1
    end
  end
end