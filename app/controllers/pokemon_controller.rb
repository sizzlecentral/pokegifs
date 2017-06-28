class PokemonController < ApplicationController

  def show
    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}", followlocation: true)
    body = JSON.parse(res.body)
    res2 = Typhoeus.get("https://api.giphy.com/v1/gifs/search?api_key=a4fb0f987d914fc3ad55228ddf7616ee&q=#{body["name"]}&rating=g", followlocation: true)
    body2 = JSON.parse(res2.body)
    render inline: '<iframe src='+body2["data"][0]["embed_url"]+' width="480" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>'
  end

end
