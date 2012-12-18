module ApplicationHelper
def title
base ="It is my title"
if @title.nil?
base
else
"#{base} | #{@title}"
end
end

def logo
image_tag("logo.png",:alt=>"Alt text",:class=>"round")
end
end
