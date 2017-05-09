class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures' do
   @figure = Figure.create(params["figure"])
   if !params[:landmark][:name].empty?
     @figure.landmarks << Landmark.create(params[:landmark])
   end



   if !params[:title][:name].empty?
     @figure.titles << Title.create(params[:title])
   end

   @figure.save
     redirect to "/figures/#{@figure.id}"
   end

   post '/figures/:id/' do
     @figure = Figure.find(params[:id])
     @figure.update(params[:figure])

     if !params[:landmark][:name].empty?
       @figure.titles << Title.create(params[:title])
     end
     @figure.save
     redirect to "/figures/#{@figure.id}"

   end


# pass it back to each of the objects and via their params and then save each objects
# first, I need to check if

#{"figure"=>{"name"=>"Dog"}, "title"=>{"name"=>"god"}, "landmarks"=>["1"], "landmark"=>{"name"=>"Stat", "year_completed"=>"1978"}}

end
