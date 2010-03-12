Xmlrpc2Html::Setup.setup do
  display 'Web Service Testing'
  
  target 'http://isp-perl.hargray.org/cgi-bin/isp-async.cgi' do
    display 'isp-sync.cgi'
    method 'isp.reserve_username' do
      display 'ISP Reserve Username'
      input_template :username => String
      test 'Return success' do
        input :username => 'xmlrpctest9999'
        expect :status => 'SUCCESS'
      end
    end
  end

  target 'http://isp-perl.hargray.org/cgi-bin/isp-async.cgi' do
    display 'isp-sync.cgi'
    method :add do
      display 'Add Numbers'
      input_template [Integer, Integer]
      test 'Add' do
        input [1, 2]
        expect 3
      end
    end
  end
end
