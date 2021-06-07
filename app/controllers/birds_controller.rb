class BirdsController < ApplicationController
  # def index
  #   birds = Bird.all
  #   render json: birds
  # end

  # Only option Method 
  # def index
  #   birds = Bird.all
  #   render json: birds, only: [:id, :name, :species]
  # end

  # Except option Method
  # def index
  #   birds = Bird.all
  #   render json: birds, except: [:created_at, :updated_at]
  # end

  # Without the Rails Magic 
  def index
    birds = Bird.all
    render json: birds.to_json(except: [:created_at, :updated_at])
  end


  # def show 
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird
  # end 

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species } 
  # end

  # Slice Method
  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  # end

  # Error Message 
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end


end