require 'rubygems'
require 'sinatra'

#set :static, File.dirname(__FILE__) + '/static'

helpers do
  def layout(body)
  navbar = <<-_HTML_
    <h3>Target 1</h3>
    <ul>
      <li><a href="target1/method1">Method 1</a></li>
    </ul>
    _HTML_
  
  return <<-_HTML_
  <html>
    <head>
      <title>xmlrpc2html</title>
      <link href="style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
      <div id="navbar">
        #{navbar}
      </div>
      <div id="content">
        #{body}
      </div>
    </body>
  </html>
  _HTML_
  end
end

get '/' do
  return layout("Lorem ipsum")
end