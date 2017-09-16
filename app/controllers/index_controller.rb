get '/' do

  erb :'/index'
end

post '/videos' do
  @key = ENV["YOUTUBE_KEY"]

  response = HTTParty.get("https://www.googleapis.com/youtube/v3/search?key=#{@key}&type=video&part=snippet&maxResults=10&q=#{params[:search]}")["items"]

  erb :'results', locals: {results: response}
end