# require 'json'

# def save_data(data, file)
#   hashed_data = data.map(&:to_h)
#   json = JSON.generate(hashed_data)
#   formatted_json = json.gsub('},{', "},\n{") # add newline after each object
#   File.write(file, formatted_json)
# end

# def read_data(file)
#   if File.exist?(file)
#     data = File.read(file)
#     JSON.parse(data)
#   else
#     []
#   end
# end
