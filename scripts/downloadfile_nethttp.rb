require 'net/http'

# Must be somedomain.net instead of somedomain.net/, otherwise, it will throw exception.
Net::HTTP.start("rd.software.yahoo.com") do |http|
  resp = http.get("/msgr/11/")
  open("msgr11us.exe", "wb") do |file|
    file.write(resp.body)
  end
end
puts "Done."