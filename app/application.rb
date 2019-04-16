# class Application
#   def call(env)
#     resp = Rack::Response.new
#     time = Time.now
#     if time.hour < 12
#       resp.write "Good Morning!"
#     else
#       resp.write "Good Afternoon!"
#     end
#     resp.finish
#   end
# end

class Application
 
  @@items = ["Apples","Carrots","Pears"]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
      @@items.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
 
      search_term = req.params["q"]
 
      if @@items.include?(search_term)
        resp.write "#{search_term} is one of our items"
      else
        resp.write "Couldn't find #{search_term}"
      end
 
    else
      resp.write "Path Not Found"
    end
 
    resp.finish
  end
end