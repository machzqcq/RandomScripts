require 'win32ole'

#http://rubyonwindows.blogspot.com/
# https://www.ruby-forum.com/topic/106152

def get_input(prompt='', title='')
  excel = WIN32OLE.new('Excel.Application')
  response = excel.InputBox(prompt, title)
  excel.Quit
  excel = nil
  return response
end

name = get_input('My Prompt', 'My Title')
p name
password = get_input('My Prompt', 'My Title')
p password
