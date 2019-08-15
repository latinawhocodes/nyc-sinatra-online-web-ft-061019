class LandmarksController < ApplicationController
  get '/landmarks' do
    erb :'/landmarks/index'
  end 

  get 'landmarks/new' do 
    @figures = Figure.all 
    erb :"/landmarks/new"
  end 

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    if !params[:figure][:name].empty?
      @landmark.figure << Figure.create(name: params[:figure][:name])
    end 
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end 

  get '/landmarks/:id' do 
    @landmark = Landmark.find_by(id: params[:id])
    erb 

end
