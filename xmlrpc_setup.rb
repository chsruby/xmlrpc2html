class XmlrpcSetup
  def XmlrpcSetup.setup(display = '', &block)
    setup = self.new
    setup.display = display
    puts setup.display
    setup.instance_eval(&block)
    return setup
  end
  
  attr_accessor :display
    
  def target url, options, &block
    puts url
    puts options[:display]
    block.call
  end
  
  def method method_name, options, &block
    puts method_name
    puts options[:display]
    block.call
  end
  
  def input_template template
    puts template.inspect
  end
  
  def test test_name, &block
    block.call
  end
  
  def input input_data
    puts input_data.inspect
  end
  
  def expect expect_data
    puts expect_data.inspect
  end
end
