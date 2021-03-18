class UsersController < ApplicationController
  # GET /users/1
  def show
    @user = User.find(params[:id])
    @favs = @user.favourites.map { |fav| { id: fav.id, game_id: fav.game_id } }

    render json: { info: @user, favs: @favs }
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:username)
  end
end
