require 'ostruct'
module Xmlrpc2Html
  class Setup < OpenStruct
    def self.setup(&block)
      app = self.new :display_as => ''
      app.instance_eval(&block)
      return Xmlrpc2Html::Generate.new(app)
    end
    
    def display display
      self.display_as = display
    end
    
    def target url, options = {}, &block
      new_target = Target.new :xmlrpc_methods => [],
                              :url => url,
                              :options => options,
                              :display_as => nil
      new_target.instance_eval(&block)
      self.targets << new_target
    end
  
    class Target < OpenStruct
      def display display
        self.display_as = display
      end
        
      def method method_name, options = {}, &block
        new_method = XmlrpcMethod.new :tests => [],
                                :method_name => method_name,
                                :options => options,
                                :display_as => nil
        new_method.instance_eval(&block)
        self.xmlrpc_methods << new_method
      end
    
      class XmlrpcMethod < OpenStruct
        def display display_name
          self.display = display_name
        end
        
        def input_template template
          self.input_template = template
        end
  
        def test test_name, &block
          new_test = Test.new :display_as => nil
          new_test.instance_eval(&block)
          self.tests << new_test
        end
    
        class Test < OpenStruct
          def display display_as
            self.display_as = display_as
          end
          
          def input input
            self.input = input
          end
  
          def expect expect
            self.expect = expect
          end
        end
      end
    end
  end
end