class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    matching_movies = Movie.all

    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
    end

    matching_directors = Director.all

    @directors = Director.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @directors
      end

      format.html
    end
  end

  def show
    @director = Director.find(params.fetch(:id))
  end

  def create
    director_attributes = params.require(:director).permit(:name, :studio)
    
    @director = Director.new(director_attributes)

    if @director.valid?
      @director.save
      redirect_to movies_url, notice: "Director created successfully."
    else
      render "directors/new"
    end
  end

  def edit
    @director = Director.find(params.fetch(:id))
  end

  def update
    @director_attributes = params.require(:director).permit(:name, :studio)
    @director = Director.find(params.fetch(:id))
    @director.update(@director_attributes)

    if @director.valid?
      @director.save
      redirect_to director_url(@director), notice: "Director updated successfully."
    else
      redirect_to director_url(@director), alert: "Director failed to update successfully."
    end
  end

  def destroy
    @director = Director.find(params.fetch(:id))

    @director.destroy

    redirect_to movies_url, notice: "Director deleted successfully."
  end
end
