class PokemonController < ApplicationController

  def show
    res = Typhoeus.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}", followlocation: true)
    body = JSON.parse(res.body)
    render json: {
      id:     body["id"],
      name:   body["name"],
      types:  body["types"]
    }
  end

end
