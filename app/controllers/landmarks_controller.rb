class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by( params[:id] )

    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by( params[:id] )

    erb :"landmarks/edit"
  end

  post '/landmarks' do

    @landmark = Landmark.create( name: params[:landmark][:name], year_completed: params[:landmark][:year_completed] )

    erb :"landmarks/show"
  end

  post "/landmarks/:id" do
    @landmark = Landmark.find_by( params[:id] )
    @landmark.name = params[:landmark][:name]
    @landmark.year_completed = params[:landmark][:year_completed]
    @landmark.save

    erb :"landmarks/show"

  end

end
