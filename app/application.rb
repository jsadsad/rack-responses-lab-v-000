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
  @@items = ["Burger", "Quest Bar", "Protein Shake"]
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    @@items.each do |item|
      resp.write"#{item} \n"
    end
  end
end