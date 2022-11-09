class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
 get '/bakeries' do
  "Hello World"
  baker = Bakery.all
  baker.to_json
 end

 get '/bakeries/:id' do
  baker = Bakery.find(params[:id])
  baker.to_json(include: :baked_goods)
 end

get '/baked_goods/by_price' do 
  baker = BakedGood.all.order(price: :desc) 
  baker.to_json
end

get '/baked_goods/most_expensive' do 
  baker= BakedGood.all.order(price: :desc).first
  baker.to_json
end

end
