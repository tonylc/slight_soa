module ApplicationHelper
  def add_to_js(js)
    @js ||= []
    if js == 'jquery-ui'
      js = 'https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js'
    end
    @js << js
  end

  def add_to_css(css)
    @css ||= []
    if css == 'jquery-ui'
      css = 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css'
    end
    @css << css
  end
end
