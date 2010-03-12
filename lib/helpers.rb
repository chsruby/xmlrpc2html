helpers do
  def navbar(app)
    navbar = ''
    app.targets.sort_by {|t| t.display_as }.each_with_index do |target, target_i|
      navbar << '<h3>%s</h3>' % target.display_as
      navbar << '<ul>'
      target.xmlrpc_methods.sort_by {|m| m.display_as }.each_with_index do |method, method_i|
        puts method.inspect
        href = "target#{target_i}/method#{method_i}"
        navbar << '<li><a href="%s">%s</a></li>' % [href, method.display_as]
      end
      navbar << '</ul>'
    end
    navbar
  end

  def layout(app, body)
    raise ArgumentError "app must be Xmlrpc2Html::Setup" unless app.is_a?(Xmlrpc2Html::Setup)
    return <<-_HTML_
    <html>
      <head>
        <title>xmlrpc2html</title>
        <link href="style.css" rel="stylesheet" type="text/css" />
      </head>
      <body>
        <div id="navbar">
          #{navbar(app)}
        </div>
        <div id="content">
          #{body}
        </div>
      </body>
    </html>
    _HTML_
  end
end
