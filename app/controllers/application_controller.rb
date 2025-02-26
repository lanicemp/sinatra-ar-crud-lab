
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do 
    erb :new 
  end 

  post '/articles' do 
    @articles = Article.new(title: params[:title], content: params[:content])
    @articles.save
    redirect "/articles/#{@articles.id}"
  end 

  get 'articles/id' do 
    binding.pry
    erb :show
  end 

  # get '/articles' do 
  #   @articles = Article.new(params[:title], params[:content])
  # erb :show

  # end 

end
