require File.dirname(__FILE__) + '/../lib/xmlrpc_setup.rb'
XmlrpcSetup.setup 'Web Service Testing' do
  target 'http://isp-perl.hargray.org/cgi-bin/isp-async.cgi', :display => 'isp-sync.cgi' do
    method 'isp.reserve_username', :display => 'ISP Reserve Username' do
      input_template :username => String
      test 'Return success' do
        input :username => 'xmlrpctest9999'
        expect :status => 'SUCCESS'
      end
    end
  end

  target 'http://isp-perl.hargray.org/cgi-bin/isp-async.cgi', :display => 'isp-sync.cgi' do
    method :add, :display => 'Add Numbers' do
      input_template [Integer, Integer]
      test 'Add' do
        input [1, 2]
        expect 3
      end
    end
  end
end
